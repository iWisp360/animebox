// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use std::{collections::HashMap, sync::LazyLock};

use crate::api::data::{
  network::CLIENT,
  video_providers::{Video, VideoProviderImpl, error::VideoProviderError},
};
use regex::Regex;
use reqwest::header::{HeaderValue, REFERER};

static VIDEO_REGEX: LazyLock<Regex> = LazyLock::new(|| Regex::new(r#"file:.*?'(.*)'"#).unwrap());

pub struct YourUpload {}

impl VideoProviderImpl for YourUpload {
  async fn get_direct_video(&self, url: String) -> Result<Video, VideoProviderError> {
    let response = CLIENT
      .get(url)
      .header(
        REFERER,
        HeaderValue::from_static("https://www.yourupload.com/"),
      )
      .send()
      .await?
      .text()
      .await?;

    let final_url = VIDEO_REGEX
      .captures(response.as_str())
      .map(|c| c[1].to_string());

    let mut headers = HashMap::new();
    headers.insert(
      REFERER.as_str().to_string(),
      "https://www.yourupload.com/".to_string(),
    );

    Ok(Video {
      url: final_url,
      headers,
    })
  }
}
