use crate::api::{
  app::{
    languages::AppLanguages,
    sections::HomeTabs,
    themes::{ThemeModes, Themes},
  },
  data::metadata::utils::{MetadataSourceConfig, MetadataSources},
  server::models::ConfigServer,
};
use flutter_rust_bridge::frb;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
#[serde(default)]
#[frb(non_final)]
pub struct AnimeBoxConfig {
  #[frb(non_final)]
  #[serde(default)]
  pub data_path_uninitialized: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub appearance: AppearanceConfig,
  #[frb(non_final)]
  #[serde(default)]
  pub metadata: MetadataConfig,
  #[frb(non_final)]
  #[serde(default)]
  pub downloads: DownloadsConfig,
  #[frb(non_final)]
  #[serde(default)]
  pub playback: PlaybackConfig,
  #[frb(non_final)]
  #[serde(default)]
  pub library: LibraryConfig,
  #[frb(non_final)]
  #[serde(default)]
  pub servers: ServersConfig,
  #[frb(non_final)]
  #[serde(default)]
  pub local_storage: LocalStorageConfig,
  #[frb(non_final)]
  #[serde(default)]
  pub advanced: AdvancedConfig,
}

#[derive(Serialize, Deserialize)]
#[serde(default)]
#[frb(non_final)]
pub struct AppearanceConfig {
  #[frb(non_final)]
  #[serde(default)]
  pub lang: AppLanguages,
  #[frb(non_final)]
  #[serde(default)]
  pub init_screen: HomeTabs,
  #[frb(non_final)]
  #[serde(default)]
  pub mode: ThemeModes,
  #[frb(non_final)]
  #[serde(default)]
  pub theme: Themes,
  #[frb(non_final)]
  #[serde(default)]
  pub relative_dates: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub pitch_black: bool,
}

#[derive(Serialize, Deserialize)]
pub struct MetadataConfig {
  #[serde(default = "default_metadata_sources")]
  pub preferred_meta_sources: Vec<MetadataSourceConfig>,
}

#[derive(Serialize, Deserialize)]
#[serde(default)]
#[frb(non_final)]
pub struct DownloadsConfig {
  #[frb(non_final)]
  #[serde(default)]
  pub unmetered_networks_only: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub downloaded_chapters_format: String,
  #[frb(non_final)]
  #[serde(default)]
  pub max_threads: u8,
}

#[derive(Serialize, Deserialize, Default)]
#[serde(default)]
pub struct PlaybackConfig {}

#[derive(Serialize, Deserialize)]
#[serde(default)]
#[frb(non_final)]
pub struct LibraryConfig {
  #[frb(non_final)]
  #[serde(default)]
  pub custom_categories: Vec<String>,
  #[frb(non_final)]
  #[serde(default)]
  pub def_category: String,
  #[frb(non_final)]
  #[serde(default)]
  pub update_params: UpdateParams,
}

#[derive(Serialize, Deserialize, Default)]
#[serde(default)]
#[frb(non_final)]
pub struct ServersConfig {
  #[frb(non_final)]
  #[serde(default)]
  pub servers: Vec<ConfigServer>,
}

#[derive(Serialize, Deserialize)]
#[serde(default)]
#[frb(non_final)]
pub struct LocalStorageConfig {
  #[frb(non_final)]
  #[serde(default)]
  pub data_path: String,
  #[frb(non_final)]
  #[serde(default)]
  pub delete_watched_chapters: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub enable_backup: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub enable_automatic_backups: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub backup_interval: u32,
}

#[derive(Serialize, Deserialize)]
#[serde(default)]
#[frb(non_final)]
pub struct AdvancedConfig {
  #[frb(non_final)]
  #[serde(default)]
  pub debug_logs: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub user_agent: String,
}

#[derive(Serialize, Deserialize)]
#[serde(default)]
#[frb(non_final)]
pub struct UpdateParams {
  #[frb(non_final)]
  #[serde(default)]
  pub auto_updates_enable: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub auto_updates_interval: u32, // hours
  #[frb(non_final)]
  #[serde(default)]
  pub custom_interval: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub auto_updates_mobile_data: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub check_metadata_too: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub avoid_watched_series: bool,
  #[frb(non_final)]
  #[serde(default)]
  pub avoid_completed_series: bool,
}

impl Default for AnimeBoxConfig {
  fn default() -> Self {
    Self {
      data_path_uninitialized: true,
      appearance: AppearanceConfig::default(),
      metadata: MetadataConfig::default(),
      downloads: DownloadsConfig::default(),
      playback: PlaybackConfig::default(),
      library: LibraryConfig::default(),
      servers: ServersConfig::default(),
      local_storage: LocalStorageConfig::default(),
      advanced: AdvancedConfig::default(),
    }
  }
}
impl Default for AppearanceConfig {
  fn default() -> Self {
    Self {
      lang: AppLanguages::EN,
      init_screen: HomeTabs::Home,
      theme: Themes::Dynamic,
      mode: ThemeModes::System,
      relative_dates: true,
      pitch_black: false,
    }
  }
}
impl Default for MetadataConfig {
  fn default() -> Self {
    Self {
      preferred_meta_sources: default_metadata_sources(),
    }
  }
}

fn default_metadata_sources() -> Vec<MetadataSourceConfig> {
  vec![
    MetadataSourceConfig {
      enabled: true,
      source: MetadataSources::MyAnimeList,
    },
    MetadataSourceConfig {
      enabled: true,
      source: MetadataSources::AniList,
    },
  ]
}

impl Default for DownloadsConfig {
  fn default() -> Self {
    Self {
      unmetered_networks_only: true,
      downloaded_chapters_format: "Episode %n".to_string(),
      max_threads: 4,
    }
  }
}
impl Default for LibraryConfig {
  fn default() -> Self {
    Self {
      custom_categories: vec![],
      def_category: "%home%".to_string(),
      update_params: UpdateParams::default(),
    }
  }
}

impl Default for UpdateParams {
  fn default() -> Self {
    Self {
      auto_updates_enable: false,
      auto_updates_interval: 6,
      custom_interval: false,
      auto_updates_mobile_data: false,
      check_metadata_too: true,
      avoid_watched_series: true,
      avoid_completed_series: true,
    }
  }
}

impl Default for LocalStorageConfig {
  fn default() -> Self {
    Self {
      data_path: "".to_string(),
      delete_watched_chapters: false,
      enable_backup: false,
      enable_automatic_backups: false,
      backup_interval: 3,
    }
  }
}

impl Default for AdvancedConfig {
  fn default() -> Self {
    Self {
      debug_logs: false,
      user_agent: "Mozilla/5.0 (X11; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0"
        .to_string(),
    }
  }
}
