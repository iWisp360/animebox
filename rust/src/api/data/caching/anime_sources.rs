// SPDX-FileCopyrightText: 2026 iWisp360
// SPDX-License-Identifier: AGPL-3.0-only

use crate::{
  api::{
    app::{PRETTY_CONFIG, configuration::controllers::CONFIG_PATH},
    data::{
      caching::utils::{CacheSource, Expirable, GetPath, ReadWrite},
      models::AnimeSource,
    },
    server::{
      error::GraphQLError,
      graphql::{Client, SERVER_SUPPORTED_SOURCES_QUERY},
      models::ConfigServer,
    },
  },
  frb_generated::StreamSink,
  impl_string_representation,
};
use flutter_rust_bridge::frb;
use log::error;
use ron::ser::to_string_pretty;
use serde::{Deserialize, Serialize};
use std::{
  collections::HashMap,
  fmt::{Display, Formatter},
  io,
  path::PathBuf,
};
use uuid::Uuid;

#[derive(Deserialize)]
pub struct ServerSourcesResponse {
  #[serde(rename = "ServerInfo")]
  pub response: ServerSources,
}

#[derive(Deserialize)]
pub struct ServerSources {
  #[serde(rename = "supportedAnimeSources")]
  pub sources: Vec<AnimeSource>,
}

#[derive(thiserror::Error, Debug)]
pub enum SourcesRefreshError {
  #[error("Server error: {0}")]
  GraphQL(String),
  #[error("This server returned invalid data")]
  InvalidData,
}

impl_string_representation!(SourcesRefreshError, (GraphQL, GraphQLError));

#[derive(Debug, Clone)]
pub struct RefreshJob {
  pub running_on: Vec<String>,
  pub success: u32,
  pub error: u32,
  pub total: u32,
}

impl AnimeSources for AnimeSourcesCacheManager {
  fn get_sources(&self) -> HashMap<[u8; 16], Vec<AnimeSource>> {
    self.sources.clone()
  }

  async fn refresh_sources(
    &mut self,
    force_fetch: bool,
    no_fetch: bool, // ignored if the cache is empty
    only_missing: bool,
    progress_sink: StreamSink<RefreshJob>,
    servers: Vec<ConfigServer>,
  ) -> Result<(), SourcesRefreshError> {
    let needed_servers = if only_missing {
      servers
        .iter()
        .filter(|s| !self.sources.contains_key(&s.uuid))
        .collect::<Vec<&ConfigServer>>()
    } else {
      servers.iter().collect()
    };

    let mut refresh_job = RefreshJob {
      running_on: needed_servers
        .iter()
        .map(|s| Uuid::from_bytes(s.uuid).to_string())
        .collect(),
      success: 0,
      error: 0,
      total: needed_servers.len() as u32,
    };

    if no_fetch && !self.sources.is_empty() {
      let _ = progress_sink.add(refresh_job);
      Ok(())
    } else if self.is_expired() || force_fetch || self.sources.is_empty() {
      let mut new_sources: HashMap<[u8; 16], Vec<AnimeSource>> = HashMap::new();

      for server in needed_servers {
        let client = Client::new(server.url.as_str());
        match client
          .query::<ServerSourcesResponse>(SERVER_SUPPORTED_SOURCES_QUERY)
          .await
        {
          Ok(supported_sources) => {
            new_sources.insert(server.uuid, supported_sources.response.sources);
            refresh_job.success += 1;
            refresh_job
              .running_on
              .retain(|e| *e != Uuid::from_bytes(server.uuid).to_string());

            if progress_sink.add(refresh_job.clone()).is_err() {
              return Ok(());
            }
          }

          Err(error) => {
            error!(
              "Refresh error for uuid {}: {error}",
              Uuid::from_bytes(server.uuid)
            );

            refresh_job.error += 1;
            if progress_sink.add(refresh_job.clone()).is_err() {
              return Ok(());
            }
          }
        }
      }

      self.sources.extend(new_sources);
      Ok(())
    } else {
      let _ = progress_sink.add(refresh_job);
      Ok(())
    }
  }
}

static ANIME_SOURCES_CACHE_PATH: &str = "animebox.sources.ron";

#[frb(opaque)]
#[derive(Deserialize, Serialize, Default)]
pub struct AnimeSourcesCacheManager {
  pub sources: HashMap<[u8; 16], Vec<AnimeSource>>,
  pub last_update: i64,
}

pub trait AnimeSources {
  fn get_sources(&self) -> HashMap<[u8; 16], Vec<AnimeSource>>;
  fn refresh_sources(
    &mut self,
    force_fetch: bool,
    no_fetch: bool,
    only_missing: bool,
    progress_sink: StreamSink<RefreshJob>,
    servers: Vec<ConfigServer>,
  ) -> impl std::future::Future<Output = Result<(), SourcesRefreshError>> + Send;
}

#[frb(ignore)]
impl GetPath for AnimeSourcesCacheManager {
  fn origin_path() -> Result<String, io::Error> {
    if let Some(path) = CONFIG_PATH.get() {
      Ok(
        PathBuf::from(path)
          .join(ANIME_SOURCES_CACHE_PATH)
          .to_string_lossy()
          .to_string(),
      )
    } else {
      Err(io::Error::new(
        io::ErrorKind::NotFound,
        "CONFIG_PATH is not set",
      ))
    }
  }
}

#[frb(ignore)]
impl Display for AnimeSourcesCacheManager {
  fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
    write!(
      f,
      "{}",
      to_string_pretty(self, PRETTY_CONFIG.clone()).unwrap()
    )
  }
}

impl CacheSource for AnimeSourcesCacheManager {}

#[frb(ignore)]
impl ReadWrite for AnimeSourcesCacheManager {}

impl Expirable for AnimeSourcesCacheManager {
  fn get_expiration_date(&self) -> i64 {
    self.last_update
  }
}
