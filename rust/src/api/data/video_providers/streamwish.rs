// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use std::sync::OnceLock;

use crate::api::{
  data::video_providers::utils::{Video, VideoProviderImpl, dumb_fetcher, headermap_to_hashmap},
  webview,
};
use anyhow::Error;
use flutter_rust_bridge::{DartFnFuture, frb};
use js_unpack::JsUnpack;
use log::debug;
use regex::Regex;
use reqwest::header::{HeaderMap, HeaderValue, REFERER};

pub struct StreamWish {}

#[frb(ignore)]
pub static STREAMWISH_CONTENT_FETCHER: OnceLock<
  Box<dyn Fn(String) -> DartFnFuture<String> + Send + Sync>,
> = OnceLock::new();

impl VideoProviderImpl for StreamWish {
  async fn get_direct_video(&self, url: String) -> Result<Video, Error> {
    let response: String = self.get_content(url).await?;

    let scripts_regex = Regex::new(r#"(?s)<script[^>]*>(.*?)<\/script>"#)?;
    let m3u8_regex = Regex::new(r#"https[^"]*m3u8[^"]*"#)?;

    let mut headers = HeaderMap::new();
    headers.insert(REFERER, HeaderValue::from_static("https://streamwish.to/"));

    let scripts = scripts_regex.captures_iter(response.as_str());

    let packed_script: String = scripts
      .map(|capture| capture[1].to_string())
      .find(|element| element.contains("eval(function(p,a,c"))
      .unwrap();

    let unpacked_script = JsUnpack::new(packed_script.as_str())
      .unpack()
      .map_err(Error::msg)?;

    let final_url = m3u8_regex
      .captures(unpacked_script.as_str())
      .map(|c| c[0].to_string());

    Ok(Video {
      url: final_url,
      headers: headermap_to_hashmap(headers),
    })
  }

  async fn get_content(&self, url: String) -> anyhow::Result<String>
  where
    Self: Sized,
  {
    #[cfg(not(target_os = "linux"))]
    if let Some(fetcher) = STREAMWISH_CONTENT_FETCHER.get() {
      webview::fetch::get_content(url, fetcher).await
    } else {
      Err(anyhow::anyhow!("STREAMWISH_CONTENT_FETCHER isn't set"))
    }

    #[cfg(target_os = "linux")]
    webview::fetch::get_content(url, Box::new(dumb_fetcher)).await
  }
}

pub fn init_streamwish_fetcher_function(
  fetcher: impl Fn(String) -> DartFnFuture<String> + Send + Sync + 'static,
) {
  if STREAMWISH_CONTENT_FETCHER.set(Box::new(fetcher)).is_err() {
    debug!("STREAMWISH_CONTENT_FETCHER was already set");
  };
}
