// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

pub mod error;
pub mod graphql;
pub mod models;

// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use crate::api::{
  data::models::SearchResult,
  server::{
    error::ServerError,
    graphql::{
      Client, SEARCH_QUERY, SERVER_INFO_QUERY, SearchResponse, SearchVariables, ServerInfoResponse,
    },
    models::ConfigServer,
  },
};
use flutter_rust_bridge::frb;
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

pub async fn get_server(url: String) -> Result<ConfigServer, ServerError> {
  let response = Client::new(url.as_str())
    .query::<ServerInfoResponse>(SERVER_INFO_QUERY)
    .await?;

  Ok(ConfigServer {
    enabled: true,
    uuid: response.server_info.uuid,
    name: response.server_info.name,
    logo_url: response.server_info.logo_url,
    url,
  })
}

pub async fn search(
  server_url: String,
  pattern: String,
  source_id: String,
) -> Result<Vec<SearchResult>, ServerError> {
  let response = Client::new(server_url.as_str())
    .query_with_variables::<SearchResponse, SearchVariables>(
      SEARCH_QUERY,
      &SearchVariables { pattern, source_id },
    )
    .await?;

  Ok(response.search.results)
}
