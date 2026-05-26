use flutter_rust_bridge::{DartFnFuture, frb};
use reqwest::Client;
use reqwest::header::HeaderMap;
use std::{collections::HashMap, sync::LazyLock};

pub static CLIENT: LazyLock<Client> = LazyLock::new(Client::new);

pub trait VideoProviderImpl {
  fn get_direct_video(&self, url: String) -> impl Future<Output = anyhow::Result<Video>>
  where
    Self: Sized;
  fn get_content(&self, url: String) -> impl Future<Output = anyhow::Result<String>>
  where
    Self: Sized,
  {
    async { Ok(url) }
  }
}

pub enum VideoProvider {
  Provider(Box<dyn VideoProviderImpl>),
  Unknown,
}

pub struct Video {
  pub url: Option<String>,
  pub headers: HashMap<String, String>,
}

#[frb(ignore)]
pub fn headermap_to_hashmap(headermap: HeaderMap) -> HashMap<String, String> {
  let mut hashmap = HashMap::new();

  for (key, value) in headermap {
    if let Some(key) = key {
      hashmap.insert(
        key.to_string(),
        value.to_str().unwrap_or_default().to_string(),
      );
    }
  }

  hashmap
}

#[frb(ignore)]
pub fn dumb_fetcher(url: String) -> DartFnFuture<String> {
  Box::pin(dumb_call(url))
}

#[frb(ignore)]
pub async fn dumb_call(url: String) -> String {
  url
}
