use serde::{Deserialize, Serialize};

use crate::api::data::models::Search;

#[derive(Deserialize)]
pub struct ServerInfoResponse {
  #[serde(rename = "ServerInfo")]
  pub server_info: ServerInfoTiny,
}
#[derive(Deserialize)]
pub struct SearchResponse {
  #[serde(rename = "Search")]
  pub search: Search,
}

#[derive(Deserialize)]
#[flutter_rust_bridge::frb(ignore)]
pub struct ServerInfoTiny {
  pub name: Option<String>,
  #[serde(rename = "logoUrl")]
  pub logo_url: Option<String>,
  pub version: u32,
  #[serde(rename = "minCompat")]
  pub min_compat: u32,
}

pub static SERVER_INFO_QUERY: &str = "
  query { 
    ServerInfo { 
      name 
      version 
      minCompat 
      logoUrl 
    }
  }
";

pub static SEARCH_QUERY: &str = "
  query Search($pattern: String!, $sourceId: ID!) {
    Search(pattern: $pattern, sourceId: $sourceId) {
      data {
      	url
      	name
      	image
      }
      
      fetchDate
    }
  }
";

#[derive(Serialize, Deserialize)]
pub struct SearchVariables {
  pub pattern: String,
  #[serde(rename = "sourceId")]
  pub source_id: String,
}
