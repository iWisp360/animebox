// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use crate::api::data::video_providers::utils::{
  CLIENT, Video, VideoProviderImpl, headermap_to_hashmap,
};
use regex::Regex;
use reqwest::header::{HeaderMap, HeaderValue, REFERER};

pub struct MP4Upload {}

impl VideoProviderImpl for MP4Upload {
  async fn get_direct_video(&self, url: String) -> anyhow::Result<Video>
  where
    Self: Sized,
  {
    let mut headers = HeaderMap::new();
    headers.insert(REFERER, HeaderValue::from_static("https://mp4upload.com/"));

    let response = CLIENT
      .get(url)
      .headers(headers.clone())
      .send()
      .await?
      .text()
      .await?;

    let src_regex = Regex::new(r#"src:\s*"([^"]+)""#)?;

    let final_url = src_regex
      .captures(response.as_str())
      .map(|c| c[1].to_string());

    Ok(Video {
      url: final_url,
      headers: headermap_to_hashmap(headers),
    })
  }
}
