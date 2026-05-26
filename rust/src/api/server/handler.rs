use crate::api::server::{
  graphql::{SERVER_INFO_QUERY, ServerInfoResponse},
  models::ConfigServer,
};
use flutter_rust_bridge::frb;
use gql_client::Client;
use url::Url;

#[frb(sync)]
pub fn validate_url(url: String) -> Option<String> {
  let url = Url::parse(url.as_str()).is_ok();
  if url {
    None
  } else {
    Some("Url is not valid".to_string())
  }
}

pub async fn get_server(url: String) -> anyhow::Result<ConfigServer> {
  let response = Client::new(url.as_str())
    .query::<ServerInfoResponse>(SERVER_INFO_QUERY)
    .await
    .map_err(|e| anyhow::anyhow!(e))?;

  match response {
    Some(response) => Ok(ConfigServer {
      enabled: true,
      name: response.server_info.name,
      logo_url: response.server_info.logo_url,
      url,
    }),
    None => Err(anyhow::anyhow!("This is not a valid server")),
  }
}
