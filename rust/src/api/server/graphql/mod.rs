// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

mod queries;

use crate::api::{data::network::CLIENT, server::error::GraphQLError};
use flutter_rust_bridge::frb;
use log::debug;
pub use queries::{
  SEARCH_QUERY, SERVER_INFO_QUERY, SERVER_SUPPORTED_SOURCES_QUERY, SearchResponse, SearchVariables,
  ServerInfoResponse,
};
use serde::{Deserialize, Serialize};
use serde_json::Value;

#[derive(Serialize, Debug)]
#[frb(ignore)]
struct GraphQLRequestBody {
  query: &'static str,
  variables: Option<Value>,
}

#[frb(ignore)]
impl GraphQLRequestBody {
  #[frb(ignore)]
  pub fn builder() -> GraphQLRequestBodyBuilder {
    GraphQLRequestBodyBuilder::default()
  }

  #[frb(ignore)]
  pub fn to_json(&self) -> Result<String, serde_json::Error> {
    serde_json::to_string(self)
  }
}

#[derive(Default)]
#[frb(ignore)]
struct GraphQLRequestBodyBuilder {
  query: &'static str,
  variables: Option<Value>,
}

#[frb(ignore)]
impl GraphQLRequestBodyBuilder {
  #[frb(ignore)]
  pub fn query(mut self, query: &'static str) -> Self {
    self.query = query;
    self
  }

  #[frb(ignore)]
  pub fn variables(mut self, variables: Value) -> Self {
    self.variables = Some(variables);
    self
  }

  #[frb(ignore)]
  pub fn build(self) -> GraphQLRequestBody {
    GraphQLRequestBody {
      variables: self.variables,
      query: self.query,
    }
  }
}

#[frb(ignore)]
pub struct Client<'a> {
  pub url: &'a str,
}

#[frb(ignore)]
impl<'a> Client<'a> {
  pub fn new(url: &'a str) -> Self {
    Self { url }
  }

  /// Creates a new GraphQL query with the specified `url` and executes
  /// the query.
  ///
  /// # Errors
  ///
  /// This function may fail on network errors and json deserialization errors
  ///
  /// - [`reqwest::Error`]
  /// - [`serde_json::Error`]
  #[frb(ignore)]
  pub async fn query<'b, T>(&self, query: &'static str) -> Result<T, GraphQLError>
  where
    T: for<'de> Deserialize<'de>,
  {
    let body = GraphQLRequestBody::builder().query(query).build();

    let response = CLIENT
      .post(self.url)
      .body(body.to_json()?)
      .send()
      .await?
      .text()
      .await?;

    #[cfg(debug_assertions)]
    {
      debug!("{response}");
      debug!("{}", body.to_json().unwrap());
    }

    let mut value = serde_json::from_str::<Value>(response.as_str())?;

    let data = value.get_mut("data");
    if let Some(data) = data
      && !data.is_null()
    {
      Ok(serde_json::from_value(data.take())?)
    } else {
      Err(if let Some(error) = value.get("errors") {
        GraphQLError::Server(error.to_string())
      } else {
        GraphQLError::Server("The server didn't specify an error message".to_string())
      })
    }
  }

  /// Creates a new GraphQL query that allow variables with the specified
  /// `url` and executes the query.
  ///
  /// # Errors
  ///
  /// This function may fail on network errors and json serialization/deserialization errors
  ///
  /// - [`reqwest::Error`]
  /// - [`serde_json::Error`]
  #[frb(ignore)]
  pub async fn query_with_variables<T, V>(
    &self,
    query: &'static str,
    variables: &V,
  ) -> Result<T, GraphQLError>
  where
    T: for<'de> Deserialize<'de>,
    V: Serialize,
  {
    let serialized_variables = serde_json::to_value(variables)?;

    let body = GraphQLRequestBody::builder()
      .query(query)
      .variables(serialized_variables)
      .build();

    let response = CLIENT
      .post(self.url)
      .body(body.to_json()?)
      .send()
      .await?
      .text()
      .await?;

    #[cfg(debug_assertions)]
    {
      debug!("{response}");
      debug!("{}", body.to_json().unwrap());
    }

    let mut value = serde_json::from_str::<Value>(response.as_str())?;

    let data = value.get_mut("data");
    if let Some(data) = data {
      Ok(serde_json::from_value(data.take())?)
    } else {
      Err(if let Some(error) = value.get("errors") {
        GraphQLError::Server(error.to_string())
      } else {
        GraphQLError::Server("The server didn't specify an error message".to_string())
      })
    }
  }
}
