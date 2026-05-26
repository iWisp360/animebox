// SPDX-FileCopyrightText: 2026 iWisp360

use crate::api::data::{metadata::utils::MetadataSources, video_providers::utils::VideoProvider};
use url::Url;

pub struct AnimeSource {
  pub pretty_name: String,
  pub id: String,
  pub url: String,
  pub other_urls: Vec<String>,
  /// disables metadata search on the client. Useful for donghua or sources with bad serie names
  pub no_meta: bool,
  pub recommendations: Option<String>,
  pub is_hentai_source: bool,
  pub lang: Language,
}

pub enum Language {
  ES,
  EN,
}

#[derive(Clone)]
pub struct SearchResult {
  pub name: Option<String>,
  pub url: Option<Url>,
  pub image: Option<Url>,
}

pub struct Search {
  pub results: Vec<SearchResult>,
  pub fetch_date: i64,
}

pub struct Serie {
  pub name: Option<String>,
  pub image: Option<String>,
  pub description: Option<String>,
  pub chapters: Option<Vec<ChapterRef>>,
  pub fetch_date: i64,
}

#[derive(Default)]
pub struct SerieMetadata {
  pub source: MetadataSources,
  pub fetch_date: i64,
  pub id: i32,
  pub name: Option<String>,
  pub image: Option<String>,
  pub description: Option<String>,
  pub status: SerieStatus,
  pub finding_precision: f64,
  pub finding_confidence: SerieMetaConfidence,
  pub studios: Option<Vec<String>>,
  pub genres: Option<Vec<String>>, // TODO map genres into an enum
  pub start_date: Option<DateObject>,
  pub end_date: Option<DateObject>,
  pub other_matches: Vec<SlimSerieMetadata>,
}

pub struct DateObject {
  pub year: Option<i32>,
  pub month: Option<u32>,
  pub day: Option<u32>,
}

pub struct SlimSerieMetadata {
  pub id: i32,
  pub name: Option<String>,
  pub image: Option<String>,
}

#[derive(Default)]
pub enum SerieMetaConfidence {
  Confident,
  Unsure,
  #[default]
  Unable,
}

#[derive(Default)]
pub enum SerieStatus {
  Ongoing,
  Finished,
  Upcoming,
  #[default]
  Unknown,
}

pub struct ChapterRef {
  pub name: Option<String>,
  pub num: Option<u16>,
  pub url: Option<String>,
}

pub struct ChapterVideos {
  pub videos: Option<Vec<VideoRef>>,
  pub fetch_date: i64,
}

pub struct VideoRef {
  pub provider: VideoProvider,
  pub url: String,
}
