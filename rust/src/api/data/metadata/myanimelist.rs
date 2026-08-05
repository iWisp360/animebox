// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use crate::{
  api::data::{
    metadata::{
      error::MetadataSourceError,
      utils::{
        JIKAN_CLIENT, MetadataSource, MetadataSources, SerieNames, SlimMetaGetter, ToDateObject,
        ToSerieMetadata, ToSlimMeta, choose_name,
      },
    },
    models::{DateObject, SerieMetaConfidence, SerieMetadata, SerieStatus, SlimSerieMetadata},
  },
  impl_to_slim_meta,
};
use chrono::{DateTime, Datelike, Utc};
use flutter_rust_bridge::frb;
use heck::ToTitleCase;
use jikan_moe::{anime, common::structs::anime::Anime};
use std::cmp::Ordering;

#[frb(ignore)]
pub struct MyAnimeListMetadata {}

impl MetadataSource for MyAnimeListMetadata {
  async fn search_metadata(
    &self,
    serie: String,
    min_precision: f64,
  ) -> Result<Option<SerieMetadata>, MetadataSourceError> {
    let serie = serie.to_title_case();
    let serie = serie.as_str();

    match JIKAN_CLIENT
      .get_anime_search(Some(anime::SearchParams {
        q: Some(serie.to_string()),
        ..Default::default()
      }))
      .await
    {
      Ok(results) => {
        if results.data.is_empty() {
          return Ok(None);
        }

        let precisions: Vec<(&Anime, f64)> =
          results.data.iter().map(|a| choose_name(a, serie)).collect();

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
          .filter(|(a, p)| a.mal_id != matching_serie.mal_id && *p >= min_precision)
          .map(|(a, _)| a.to_slim())
          .take(20 /* Temporary hardcoded value*/)
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

    match JIKAN_CLIENT.get_anime(id).await {
      Ok(response) => Ok(Some(response.data.to_serie_metadata())),
      Err(error) => Err(error.into()),
    }
  }
}

#[frb(ignore)]
fn get_serie_status(status: Option<&str>) -> SerieStatus {
  match status {
    Some("Currently Airing") => SerieStatus::Ongoing,
    Some("Finished Airing") => SerieStatus::Finished,
    Some("Not yet aired") => SerieStatus::Upcoming,
    _ => SerieStatus::Unknown,
  }
}

pub const fn match_confidence(precision: f64) -> SerieMetaConfidence {
  match precision {
    x if x >= 0.80 => SerieMetaConfidence::Confident,
    x if x >= 0.50 => SerieMetaConfidence::Unsure,
    _ => SerieMetaConfidence::Unable,
  }
}

impl SerieNames for Anime {
  fn official(&self) -> Option<&str> {
    Some(self.title.as_str())
  }

  fn english(&self) -> Option<&str> {
    self.title_english.as_deref()
  }

  fn japanese(&self) -> Option<&str> {
    self.title_japanese.as_deref()
  }

  fn synonyms(&self) -> Vec<&str> {
    self
      .title_synonyms
      .as_ref()
      .map(|titles| titles.iter().map(String::as_str).collect())
      .unwrap_or_default()
  }

  fn romaji(&self) -> Option<&str> {
    None
  }
}

impl SlimMetaGetter for Anime {
  fn get_id(&self) -> i32 {
    self.mal_id.try_into().unwrap_or(-255)
  }

  fn get_name(&self) -> Option<String> {
    Some(self.title.clone())
  }

  fn get_image(&self) -> Option<String> {
    self
      .images
      .webp
      .as_ref()
      .and_then(|i| i.large_image_url.clone())
  }
}

impl_to_slim_meta!(Anime);

impl ToSerieMetadata for Anime {
  fn to_serie_metadata(&self) -> SerieMetadata {
    SerieMetadata {
      source: MetadataSources::MyAnimeList,
      id: self.mal_id.try_into().unwrap_or(-255),
      name: Some(self.title.clone()),
      image: self.images.webp.clone().and_then(|i| i.large_image_url),
      description: self.synopsis.clone(),
      status: get_serie_status(self.status.as_deref()),
      finding_precision: 1.0,
      finding_confidence: SerieMetaConfidence::Confident,
      fetch_date: Utc::now().timestamp(),
      other_matches: vec![],

      studios: self
        .studios
        .as_ref()
        .map(|studios| studios.iter().map(|studio| studio.name.clone()).collect()),

      genres: self
        .genres
        .as_ref()
        .map(|genres| genres.iter().map(|genre| genre.name.clone()).collect()),

      start_date: self
        .aired
        .as_ref()
        .and_then(|range| range.from.map(|date| date.to_date_object())),

      end_date: self
        .aired
        .as_ref()
        .and_then(|range| range.from.map(|date| date.to_date_object())),
    }
  }
}

impl ToDateObject for DateTime<Utc> {
  fn to_date_object(&self) -> DateObject {
    DateObject {
      year: Some(self.year()),
      month: Some(self.month()),
      day: Some(self.day()),
    }
  }
}
