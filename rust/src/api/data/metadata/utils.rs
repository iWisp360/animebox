// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use crate::api::{
  app::configuration::models::AnimeBoxConfig,
  data::{
    metadata::{
      anilist::AniListMetadata, error::MetadataSourceError, myanimelist::MyAnimeListMetadata,
    },
    models::{DateObject, SerieMetadata, SlimSerieMetadata},
  },
};
use anilist_moe::AniListClient;
use flutter_rust_bridge::frb;
use jikan_moe::JikanClient;
use serde::{Deserialize, Serialize};
use std::sync::LazyLock;
use std::{fmt::Display, future::Future};

pub static JIKAN_CLIENT: LazyLock<JikanClient> = LazyLock::new(JikanClient::new);
pub static ANILIST_CLIENT: LazyLock<AniListClient> = LazyLock::new(AniListClient::new);

pub trait MetadataSource {
  fn search_metadata(
    &self,
    query: String,
    precision: f64,
  ) -> impl Future<Output = Result<Option<SerieMetadata>, MetadataSourceError>> + Send;

  fn get_metadata_for_serie(
    &self,
    id: String,
  ) -> impl Future<Output = Result<Option<SerieMetadata>, MetadataSourceError>> + Send;
}

#[derive(Serialize, Deserialize, Clone)]
#[frb(non_final)]
pub struct MetadataSourceConfig {
  #[frb(non_final)]
  #[serde(default)]
  pub enabled: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub source: MetadataSources,
}

#[frb(ignore)]
pub trait SerieNames {
  #[frb(ignore)]
  fn english(&self) -> Option<&str>;
  #[frb(ignore)]
  fn japanese(&self) -> Option<&str>;
  #[frb(ignore)]
  fn official(&self) -> Option<&str>;
  #[frb(ignore)]
  fn romaji(&self) -> Option<&str>;
  #[frb(ignore)]
  fn synonyms(&self) -> Vec<&str>;
}

#[frb(ignore)]
pub trait ToDateObject {
  fn to_date_object(&self) -> DateObject;
}

#[frb(ignore)]
pub trait ToSerieMetadata {
  fn to_serie_metadata(&self) -> SerieMetadata;
}

#[derive(Default, Clone, Copy, Deserialize, Serialize)]
pub enum MetadataSources {
  MyAnimeList,
  #[default]
  AniList,
}

impl Display for MetadataSources {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
    match self {
      Self::MyAnimeList => write!(f, "MyAnimeList"),
      Self::AniList => write!(f, "AniList"),
    }
  }
}

/// If `source` is passed, only this `source` will be called.
/// Otherwise, all providers will be tested until the `serie_metadata` variable is `Some`.
///
/// Use the title to get possible metadata for a serie query and return the best match and its id
pub async fn search_metadata(
  query: String,
  config: &AnimeBoxConfig,
  source: Option<MetadataSources>,
  precision: f64,
) -> Result<Option<SerieMetadata>, MetadataSourceError> {
  if let Some(provider) = source {
    return call_search_metadata(query, &provider, precision).await;
  } else if config
    .metadata
    .preferred_meta_sources
    .iter()
    .filter(|s| s.enabled)
    .collect::<Vec<&MetadataSourceConfig>>()
    .is_empty()
  {
    return call_search_metadata(query, &MetadataSources::default(), precision).await;
  } else {
    for source in &config.metadata.preferred_meta_sources {
      if !source.enabled {
        continue;
      }

      let serie_metadata = call_search_metadata(query.clone(), &source.source, precision).await?;
      if serie_metadata.is_some() {
        return Ok(serie_metadata);
      }
    }
  }
  Ok(None)
}

#[frb(ignore)]
pub async fn call_search_metadata(
  query: String,
  metadata_source: &MetadataSources,
  precision: f64,
) -> Result<Option<SerieMetadata>, MetadataSourceError> {
  match metadata_source {
    MetadataSources::MyAnimeList => {
      MyAnimeListMetadata {}
        .search_metadata(query, precision)
        .await
    }
    MetadataSources::AniList => AniListMetadata {}.search_metadata(query, precision).await,
  }
}

pub async fn get_metadata(
  id: String,
  metadata_source: &MetadataSources,
) -> Result<Option<SerieMetadata>, MetadataSourceError> {
  match metadata_source {
    MetadataSources::MyAnimeList => MyAnimeListMetadata {}.get_metadata_for_serie(id).await,
    MetadataSources::AniList => AniListMetadata {}.get_metadata_for_serie(id).await,
  }
}

/// Use the Jaro Winkler algorithm (implementation provided by the crate `strsim`)
/// to determine the equality of two strings(the name of a serie from a
/// search request on a metadata source).
///
/// The range goes from 0.0 to 1.0.
#[frb(ignore)]
pub fn choose_name<'a, T: SerieNames>(anime: &'a T, serie: &str) -> (&'a T, f64) {
  let mut max_precision = 0.0;
  let serie_lower = serie.to_lowercase();

  let mut check = |title: &str| {
    let precision = strsim::jaro_winkler(&title.to_lowercase(), serie_lower.as_str());
    if precision > max_precision {
      max_precision = precision;
    }
  };

  if let Some(t) = anime.official() {
    check(t);
  }
  if let Some(t) = anime.romaji() {
    check(t);
  }
  if let Some(t) = anime.english() {
    check(t);
  }
  if let Some(t) = anime.japanese() {
    check(t);
  }

  for t in anime.synonyms() {
    check(t);
  }

  (anime, max_precision)
}

#[frb(ignore)]
pub trait Expirable {
  fn is_expired(&self) -> bool;
}

#[frb(ignore)]
pub trait SlimMetaGetter {
  fn get_id(&self) -> i32;
  fn get_name(&self) -> Option<String>;
  fn get_image(&self) -> Option<String>;
}

/// Requires the struct to implement [`SlimMetaGetter`]
#[macro_export]
macro_rules! impl_to_slim_meta {
  ($struct:ty) => {
    impl $crate::api::data::metadata::utils::ToSlimMeta for $struct {
      fn to_slim(&self) -> $crate::api::data::models::SlimSerieMetadata {
        $crate::api::data::models::SlimSerieMetadata {
          name: self.get_name(),
          image: self.get_image(),
          id: self.get_id(),
        }
      }
    }
  };
}

#[frb(ignore)]
pub trait ToSlimMeta {
  fn to_slim(&self) -> SlimSerieMetadata;
}
