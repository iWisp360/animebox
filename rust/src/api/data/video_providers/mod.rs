// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

pub mod error;
pub mod mp4upload;
pub mod pixeldrain;
pub mod streamtape;
pub mod streamwish;
pub mod vidhide;
pub mod yourupload;

use crate::api::data::video_providers::error::VideoProviderError;
use flutter_rust_bridge::frb;
use regex::Regex;
use reqwest::header::HeaderMap;
use std::{collections::HashMap, sync::LazyLock};

pub static UNPACKED_JS_REGEX: LazyLock<Regex> =
  LazyLock::new(|| Regex::new(r"eval([\s\S]+?)\.split\('\|'\)\)\)").unwrap());

pub trait VideoProviderImpl {
  fn get_direct_video(
    &self,
    url: String,
  ) -> impl Future<Output = Result<Video, VideoProviderError>>
  where
    Self: Sized;
}

pub enum VideoProvider {
  Provider(Box<dyn VideoProviderImpl>),
  Unknown,
}

pub struct Video {
  pub url: Option<String>,
  pub headers: HashMap<String, String>,
}

#[frb(ignore)]
pub fn headermap_to_hashmap(headermap: HeaderMap) -> HashMap<String, String> {
  let mut hashmap = HashMap::new();

  for (key, value) in headermap {
    if let Some(key) = key {
      hashmap.insert(
        key.to_string(),
        value.to_str().unwrap_or_default().to_string(),
      );
    }
  }

  hashmap
}
