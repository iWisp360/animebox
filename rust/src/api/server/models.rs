use flutter_rust_bridge::frb;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
#[frb(non_final)]
pub struct Server {
  pub name: Option<String>,
  pub logo_url: Option<String>,
  pub url: String,
  #[frb(non_final)]
  pub enabled: bool,
  pub version: u32,
  pub min_compat: u32,
  pub supported_anime_sources: Vec<AnimeSourceInfo>,
}

#[derive(Serialize, Deserialize)]
pub struct AnimeSourceInfo {
  pub pretty_name: String,
  pub id: String,
  pub url: String,
  pub other_urls: Vec<String>,
  pub no_meta_provider: bool,
  pub recommendations: Option<String>,
  pub is_hentai_source: bool,
  pub lang: ServerLanguage,
}

#[derive(Serialize, Deserialize)]
pub enum ServerLanguage {
  ES,
  EN,
}

#[derive(Serialize, Deserialize)]
#[frb(non_final)]
pub struct ConfigServer {
  #[frb(non_final)]
  #[serde(default)]
  pub enabled: bool,
  #[serde(default)]
  pub uuid: String,
  #[serde(default)]
  pub name: Option<String>,
  #[serde(default)]
  pub url: String,
  #[serde(default)]
  pub logo_url: Option<String>,
}
