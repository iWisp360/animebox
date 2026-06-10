// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use crate::api::data::video_providers::utils::{CLIENT, Video, VideoProviderImpl};
use regex::Regex;
use reqwest::header::{HeaderValue, REFERER};
use std::{collections::HashMap, sync::LazyLock};

const MP4UPLOAD_REFERER_URL: &str = "https://mp4upload.com/";

static SRC_REGEX: LazyLock<Regex> = LazyLock::new(|| Regex::new(r#"src:\s*"([^"]+)""#).unwrap());

pub struct MP4Upload {}

impl VideoProviderImpl for MP4Upload {
  async fn get_direct_video(&self, url: String) -> anyhow::Result<Video>
  where
    Self: Sized,
  {
    let response = CLIENT
      .get(url)
      .header(REFERER, HeaderValue::from_static(MP4UPLOAD_REFERER_URL))
      .send()
      .await?
      .text()
      .await?;

    let final_url = SRC_REGEX
      .captures(response.as_str())
      .map(|c| c[1].to_string());

    let mut headers = HashMap::new();
    headers.insert(
      REFERER.as_str().to_string(),
      MP4UPLOAD_REFERER_URL.to_string(),
    );
    Ok(Video {
      url: final_url,
      headers,
    })
  }
}
