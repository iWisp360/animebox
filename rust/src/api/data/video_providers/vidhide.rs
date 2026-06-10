// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use std::{collections::HashMap, sync::LazyLock};

use js_unpack::JsUnpack;
use regex::Regex;

use crate::api::data::video_providers::utils::{
  CLIENT, UNPACKED_JS_REGEX, Video, VideoProviderImpl,
};

pub struct VidHide {}

static VIDEO_REGEX: LazyLock<Regex> =
  LazyLock::new(|| Regex::new(r#""hls2\\":\\"(https[^"\\]+)"#).unwrap());

impl VideoProviderImpl for VidHide {
  async fn get_direct_video(&self, url: String) -> anyhow::Result<Video>
  where
    Self: Sized,
  {
    let response = CLIENT.get(url).send().await?.text().await?;

    let unpacked_js = JsUnpack::new(
      &UNPACKED_JS_REGEX
        .captures(response.as_str())
        .ok_or(anyhow::anyhow!("Unpacked JS not present in response"))?[1],
    )
    .unpack()
    .map_err(|_| anyhow::anyhow!("Failed to unpack JS"))?;

    let final_url = &VIDEO_REGEX
      .captures(unpacked_js.as_str())
      .ok_or(anyhow::anyhow!("hls2 url couldn't be matched"))?[1];

    Ok(Video {
      url: Some(final_url.to_string()),
      headers: HashMap::new(),
    })
  }
}
