// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use crate::api::data::video_providers::utils::{
  CLIENT, Video, VideoProviderImpl, headermap_to_hashmap,
};
use anyhow::Error;
use js_unpack::JsUnpack;
use rand::{rng, seq::SliceRandom};
use regex::Regex;
use reqwest::header::{HeaderMap, HeaderValue, ORIGIN, REFERER, USER_AGENT};
use std::sync::LazyLock;
use url::Url;

pub struct StreamWish {}

impl VideoProviderImpl for StreamWish {
  async fn get_direct_video(&self, url: String) -> Result<Video, Error> {
    let response: String = get_content(url).await?;

    let scripts_regex = Regex::new(r#"(?s)<script[^>]*>(.*?)<\/script>"#)?;
    let m3u8_regex = Regex::new(r#"https[^"]*m3u8[^"]*"#)?;

    let mut headers = HeaderMap::new();
    headers.insert(REFERER, HeaderValue::from_static("https://streamwish.to/"));

    let scripts = scripts_regex.captures_iter(response.as_str());

    let packed_script: String = scripts
      .map(|capture| capture[1].to_string())
      .find(|element| element.contains("eval(function(p,a,c"))
      .ok_or(anyhow::anyhow!("packed script is not found"))?;

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
}

async fn get_content(url: String) -> anyhow::Result<String> {
  let parsed_url = Url::parse(url.as_str())?;
  let path = parsed_url
    .path_segments()
    .ok_or(anyhow::anyhow!("Url without path segments"))?
    .next_back()
    .unwrap_or_default();

  let mut shuffled_domains_indexes = (0..DOMAINS.len()).collect::<Vec<usize>>();
  shuffled_domains_indexes.shuffle(&mut rng());

  let mut errors = String::new();

  for i in shuffled_domains_indexes {
    match CLIENT
      .get(format!("https://{}/e/{path}", DOMAINS[i]))
      .headers(HEADERS.clone())
      .send()
      .await
    {
      Ok(contents) => match contents.text().await {
        Ok(contents) => return Ok(contents),
        Err(error) => {
          errors.push_str(format!("{error}\n").as_str());
          continue;
        }
      },
      Err(error) => {
        errors.push_str(format!("{error}\n").as_str());
        continue;
      }
    }
  }

  Err(anyhow::anyhow!(errors))
}

const DOMAINS: &[&str] = &[
  "playnixes.com",
  "hgplaycdn.com",
  "medixiru.com",
  "hglamioz.com",
  "niramirus.com",
];

static HEADERS: LazyLock<HeaderMap> = LazyLock::new(|| {
  let mut map = HeaderMap::new();
  map.insert(REFERER, HeaderValue::from_static("https://streamwish.to"));
  map.insert(ORIGIN, HeaderValue::from_static("https://streamwish.to"));
  map.insert(
    USER_AGENT,
    HeaderValue::from_static(
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0",
    ),
  );
  map
});
