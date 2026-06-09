use crate::{
  api::{
    app::{PRETTY_CONFIG, configuration::controllers::CONFIG_PATH},
    data::{
      caching::utils::{CacheSource, Expirable, GetPath, ReadWrite},
      models::AnimeSource,
    },
    server::{graphql::SERVER_SUPPORTED_SOURCES_QUERY, models::ConfigServer},
  },
  frb_generated::StreamSink,
};
use flutter_rust_bridge::frb;
use ron::ser::to_string_pretty;
use serde::{Deserialize, Serialize};
use std::{
  collections::HashMap,
  fmt::{Display, Formatter},
  io,
  path::PathBuf,
};

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

#[derive(thiserror::Error, Debug, Clone)]
pub enum CacheRefreshError {
  #[error("The connection to this server or the deserialization process failed")]
  ConnectionOrDeserializationFailed(String),
  #[error("This server returned invalid data")]
  InvalidData,
}

#[frb(unignore)]
#[derive(Clone, Debug)]
pub struct RefreshJob {
  pub running_on: Vec<String>,
  pub errors: HashMap<String, CacheRefreshError>,
  pub success: u32,
  pub error: u32,
  pub total: u32,
}

impl AnimeSources for AnimeSourcesCacheManager {
  fn get_sources(&self) -> HashMap<String, Vec<AnimeSource>> {
    self.sources.clone()
  }

  async fn refresh_sources(
    &mut self,
    force_fetch: bool,
    no_fetch: bool, // ignored if the cache is empty
    only_missing: bool,
    progress_sink: StreamSink<RefreshJob>,
    servers: Vec<ConfigServer>,
  ) -> anyhow::Result<()> {
    let needed_servers = if only_missing {
      servers
        .iter()
        .filter(|s| !self.sources.contains_key(s.uuid.as_str()))
        .collect::<Vec<&ConfigServer>>()
    } else {
      servers.iter().collect()
    };

    let mut refresh_job = RefreshJob {
      errors: HashMap::new(),
      running_on: needed_servers.iter().map(|s| s.uuid.clone()).collect(),
      success: 0,
      error: 0,
      total: needed_servers.len() as u32,
    };

    if no_fetch && !self.sources.is_empty() {
      let _ = progress_sink.add(refresh_job);
      Ok(())
    } else if self.is_expired() || force_fetch || self.sources.is_empty() {
      let mut new_sources: HashMap<String, Vec<AnimeSource>> = HashMap::new();

      for server in needed_servers {
        let client = gql_client::Client::new(server.url.clone());
        match client
          .query::<ServerSourcesResponse>(SERVER_SUPPORTED_SOURCES_QUERY)
          .await
        {
          Ok(supported_sources) => {
            if let Some(supported_sources) = supported_sources {
              new_sources.insert(server.uuid.clone(), supported_sources.response.sources);
              refresh_job.success += 1;
              refresh_job.running_on.retain(|e| e.as_str() != server.uuid);
              if progress_sink.add(refresh_job.clone()).is_err() {
                return Ok(());
              }
            } else {
              refresh_job
                .errors
                .insert(server.uuid.clone(), CacheRefreshError::InvalidData);
              refresh_job.error += 1;
              refresh_job.running_on.retain(|e| e.as_str() != server.uuid);
              if progress_sink.add(refresh_job.clone()).is_err() {
                return Ok(());
              }
            }
          }

          Err(error) => {
            refresh_job.errors.insert(
              server.uuid.clone(),
              CacheRefreshError::ConnectionOrDeserializationFailed(
                anyhow::anyhow!(error).to_string(),
              ),
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
  pub sources: HashMap<String, Vec<AnimeSource>>,
  pub last_update: i64,
}

pub trait AnimeSources {
  fn get_sources(&self) -> HashMap<String, Vec<AnimeSource>>;
  fn refresh_sources(
    &mut self,
    force_fetch: bool,
    no_fetch: bool,
    only_missing: bool,
    progress_sink: StreamSink<RefreshJob>,
    servers: Vec<ConfigServer>,
  ) -> impl std::future::Future<Output = anyhow::Result<()>> + Send;
}

#[frb(ignore)]
impl GetPath for AnimeSourcesCacheManager {
  fn origin_path() -> anyhow::Result<String, io::Error> {
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
