// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use std::{collections::HashMap, sync::LazyLock};

use js_unpack::JsUnpack;
use regex::Regex;

use crate::api::data::{
  network::CLIENT,
  video_providers::{UNPACKED_JS_REGEX, Video, VideoProviderImpl, error::VideoProviderError},
};

pub struct VidHide {}

static VIDEO_REGEX: LazyLock<Regex> =
  LazyLock::new(|| Regex::new(r#""hls2\\":\\"(https[^"\\]+)"#).unwrap());

impl VideoProviderImpl for VidHide {
  async fn get_direct_video(&self, url: String) -> Result<Video, VideoProviderError>
  where
    Self: Sized,
  {
    let response = CLIENT.get(url).send().await?.text().await?;

    let unpacked_js = JsUnpack::new(
      &UNPACKED_JS_REGEX
        .captures(response.as_str())
        .ok_or(VideoProviderError::PackedScriptNotFound)?[1],
    )
    .unpack()?;

    let final_url = &VIDEO_REGEX
      .captures(unpacked_js.as_str())
      .ok_or(VideoProviderError::HLS2UrlNotFound)?[1];

    Ok(Video {
      url: Some(final_url.to_string()),
      headers: HashMap::new(),
    })
  }
}
