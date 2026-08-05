// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use anilist_moe::{
  enums::media::MediaStatus,
  objects::{common::FuzzyDate, media::Media},
};
use flutter_rust_bridge::frb;
use heck::ToTitleCase;
use std::{cmp::Ordering, collections::HashSet};

use crate::{
  api::data::{
    metadata::{
      error::MetadataSourceError,
      myanimelist::match_confidence,
      utils::{
        ANILIST_CLIENT, MetadataSource, MetadataSources, SerieNames, SlimMetaGetter, ToDateObject,
        ToSerieMetadata, ToSlimMeta, choose_name,
      },
    },
    models::{DateObject, SerieMetaConfidence, SerieMetadata, SerieStatus, SlimSerieMetadata},
  },
  impl_to_slim_meta,
};

#[frb(ignore)]
pub struct AniListMetadata {}

impl MetadataSource for AniListMetadata {
  async fn search_metadata(
    &self,
    serie: String,
    min_precision: f64,
  ) -> Result<Option<SerieMetadata>, MetadataSourceError> {
    let serie = serie.to_title_case();
    let serie = serie.as_str();

    match ANILIST_CLIENT.anime().search_anime(serie, None, None).await {
      Ok(results) => {
        if results.data.is_empty() {
          return Ok(None);
        }

        let precisions: Vec<(&Media, f64)> =
          results.data.iter().map(|m| choose_name(m, serie)).collect();

        let (matching_serie, precision) = precisions
          .iter()
          .max_by(|a, b| a.1.partial_cmp(&b.1).unwrap_or(Ordering::Equal))
          .map(|(a, p)| (*a, *p))
          .ok_or_else(|| MetadataSourceError::PrecisionsParsing)?;

        let mut result_metadata = matching_serie.to_serie_metadata();

        result_metadata.finding_precision = precision;
        result_metadata.finding_confidence = match_confidence(precision);
        result_metadata.other_matches = precisions
          .iter()
          .filter(|(a, p)| a.id != matching_serie.id && *p >= min_precision)
          .map(|(a, _)| a.to_slim())
          .take(20 /* Temporarily Hardcoded */)
          .collect::<Vec<SlimSerieMetadata>>();

        Ok(Some(result_metadata))
      }
      Err(error) => Err(error.into()),
    }
  }

  async fn get_metadata_for_serie(
    &self,
    id: String,
  ) -> Result<Option<SerieMetadata>, MetadataSourceError> {
    let id = id.parse()?;

    match ANILIST_CLIENT.anime().get_anime_by_id(id).await {
      Ok(serie_meta) => Ok(Some(serie_meta.to_serie_metadata())),

      Err(error) => Err(error.into()),
    }
  }
}

const fn get_serie_status(status: Option<MediaStatus>) -> SerieStatus {
  match status {
    Some(MediaStatus::Finished) => SerieStatus::Finished,
    Some(MediaStatus::Releasing) => SerieStatus::Ongoing,
    Some(MediaStatus::NotYetReleased) => SerieStatus::Upcoming,
    _ => SerieStatus::Unknown,
  }
}

#[frb(ignore)]
impl SerieNames for Media {
  fn english(&self) -> Option<&str> {
    self.title.as_ref().and_then(|t| t.english.as_deref())
  }

  fn japanese(&self) -> Option<&str> {
    self.title.as_ref().and_then(|t| t.native.as_deref())
  }

  fn romaji(&self) -> Option<&str> {
    self.title.as_ref().and_then(|t| t.romaji.as_deref())
  }

  fn synonyms(&self) -> Vec<&str> {
    self
      .synonyms
      .as_ref()
      .and_then(|titles| titles.iter().map(|t| Some(t.as_str())).collect())
      .unwrap_or_default()
  }

  fn official(&self) -> Option<&str> {
    None
  }
}

impl ToDateObject for FuzzyDate {
  fn to_date_object(&self) -> DateObject {
    DateObject {
      year: self.year,
      month: self.month.map(|m| m.try_into().unwrap_or_default()),
      day: self.day.map(|d| d.try_into().unwrap_or_default()),
    }
  }
}

impl SlimMetaGetter for Media {
  fn get_id(&self) -> i32 {
    self.id.unwrap_or(-255)
  }

  fn get_image(&self) -> Option<String> {
    self.cover_image.as_ref().and_then(|i| i.large.clone())
  }

  fn get_name(&self) -> Option<String> {
    self.title.as_ref().and_then(|t| t.romaji.clone())
  }
}

impl_to_slim_meta!(Media);

impl ToSerieMetadata for Media {
  fn to_serie_metadata(&self) -> SerieMetadata {
    SerieMetadata {
      name: self.title.as_ref().and_then(|t| t.romaji.clone()),
      description: self.description.as_ref().map(|d| {
        let description = html_escape::decode_html_entities(d).to_string();
        ammonia::Builder::new()
          .tags(HashSet::new())
          .clean(description.as_str())
          .to_string()
      }),
      id: self.id.unwrap_or(-255),
      image: self.cover_image.as_ref().and_then(|i| i.large.clone()),
      source: MetadataSources::AniList,
      finding_precision: 1.0,
      finding_confidence: SerieMetaConfidence::Confident,
      genres: self.genres.clone(),
      status: get_serie_status(self.status),
      studios: self.studios.as_ref().and_then(|s| {
        s.nodes.as_ref().map(|s| {
          s.iter()
            .map(|s| {
              s.name
                .as_deref()
                .map(ToString::to_string)
                .unwrap_or_default()
            })
            .collect()
        })
      }),

      start_date: self.start_date.as_ref().map(ToDateObject::to_date_object),
      end_date: self.end_date.as_ref().map(ToDateObject::to_date_object),
      ..Default::default()
    }
  }
}
