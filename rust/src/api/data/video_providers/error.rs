use crate::{api::data::video_providers::pixeldrain, impl_string_representation};

#[derive(thiserror::Error, Debug)]
pub enum VideoProviderError {
  #[error("Url without path segments")]
  UrlNoPathSegments,
  #[error("Got these errors:\n{0}")]
  Multiple(String),
  #[error("Packed script not found")]
  PackedScriptNotFound,
  #[error("hls2 url couldn't be matched")]
  HLS2UrlNotFound,
  #[error("Js Unpacker error: {0}")]
  JsUnpack(String),
  #[error("Regex error: {0}")]
  Regex(String),
  #[error("Pixeldrain error: {0}")]
  Pixeldrain(String),
  #[error("Url parse error: {0}")]
  Url(String),
  #[error("Connection error: {0}")]
  Request(String),
}

impl_string_representation!(
  VideoProviderError,
  (JsUnpack, js_unpack::JsUnpackError),
  (Regex, regex::Error),
  (Pixeldrain, pixeldrain::PixeldrainError),
  (Url, url::ParseError),
  (Request, reqwest::Error),
);
