// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use crate::api::data::{
  network::CLIENT,
  video_providers::{Video, VideoProviderImpl, error::VideoProviderError},
};
use regex::Regex;
use std::{collections::HashMap, sync::LazyLock};

static VIDEO_REGEX: LazyLock<Regex> =
  LazyLock::new(|| Regex::new(r#"robotlink.*'(.*?)'.*?'xcd(.*?)'"#).unwrap());

pub struct StreamTape {}

impl VideoProviderImpl for StreamTape {
  async fn get_direct_video(&self, url: String) -> Result<Video, VideoProviderError> {
    let response = CLIENT.get(url).send().await?.text().await?;

    let final_url = VIDEO_REGEX.captures(&response).map(|c| {
      let (p1, p2) = (&c[1], &c[2]);
      format!("https:{}{}", p1, p2)
    });

    Ok(Video {
      url: final_url,
      headers: HashMap::default(),
    })
  }
}
