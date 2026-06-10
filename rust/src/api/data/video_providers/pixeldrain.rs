// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use crate::api::data::video_providers::utils::{Video, VideoProviderImpl};
use std::collections::HashMap;
use url::Url;

#[derive(thiserror::Error, Debug)]
pub enum PixeldrainError {
  #[error("Invalid Pixeldrain Url")]
  InvalidUrl,
  #[error("/u/ path is not present in Pixeldrain Url")]
  PathNotPresent,
}

pub struct PixelDrain {}

impl VideoProviderImpl for PixelDrain {
  async fn get_direct_video(&self, url: String) -> anyhow::Result<Video>
  where
    Self: Sized,
  {
    let parsed_url = Url::parse(url.as_str())?;

    let mut segments = parsed_url
      .path_segments()
      .ok_or(PixeldrainError::InvalidUrl)?;

    if segments.next() != Some("u") {
      return Err(PixeldrainError::PathNotPresent.into());
    }

    let video_id = segments.next().ok_or(PixeldrainError::InvalidUrl)?;
    let final_url = format!("https://pixeldrain.com/api/file/{video_id}?download");

    Ok(Video {
      url: Some(final_url),
      headers: HashMap::new(),
    })
  }
}
