use crate::impl_string_representation;

#[derive(thiserror::Error, Debug)]
pub enum MetadataSourceError {
  #[error("AniList had an issue: {0}")]
  AniList(String),
  #[error("MyAnimeList had an issue: {0}")]
  MyAnimeList(String),
  #[error("While parsing integer: {0}")]
  IntParse(String),
  #[error("Couldn't parse precisions")]
  PrecisionsParsing,
}

impl_string_representation!(
  MetadataSourceError,
  (AniList, anilist_moe::AniListError),
  (MyAnimeList, jikan_moe::JikanError),
  (IntParse, std::num::ParseIntError),
);
