use serde::Deserialize;

#[derive(Deserialize)]
pub struct ServerInfoResponse {
  #[serde(rename = "ServerInfo")]
  pub server_info: ServerInfoTiny,
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
