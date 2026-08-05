use crate::impl_string_representation;

#[derive(thiserror::Error, Debug)]
pub enum GraphQLError {
  #[error("HTTP request error: {0}")]
  Reqwest(String),
  #[error("Json parse error: {0}")]
  Json(String),
  #[error("The server threw an error: {0}")]
  Server(String),
}

impl_string_representation!(
  GraphQLError,
  (Reqwest, reqwest::Error),
  (Json, serde_json::Error)
);

#[derive(thiserror::Error, Debug)]
pub enum ServerError {
  #[error("GraphQL error: {0}")]
  GraphQL(String),
}

impl_string_representation!(ServerError, (GraphQL, GraphQLError));
