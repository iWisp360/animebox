// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use crate::api::data::video_providers::utils::{CLIENT, Video, VideoProviderImpl};
use regex::Regex;
use std::collections::HashMap;

pub struct StreamTape {}

impl VideoProviderImpl for StreamTape {
  async fn get_direct_video(&self, url: String) -> anyhow::Result<Video> {
    let response = CLIENT.get(url).send().await?.text().await?;

    let video_regex = Regex::new(r#".*robotlink.*'(.*?)'.*?'xcd(.*?)'"#)?;
    let final_url = video_regex
      .captures(&response)
      .map(|c| (c[1].to_string(), c[2].to_string()))
      .map(|(p1, p2)| format!("https:{}{}", p1, p2));

    Ok(Video {
      url: final_url,
      headers: HashMap::default(),
    })
  }
}
