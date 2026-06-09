use crate::api::app::{PRETTY_CONFIG, configuration::models::AnimeBoxConfig};
use flutter_rust_bridge::frb;
use log::{debug, error, info};
use std::{
  fs::{File, create_dir_all},
  io::{BufReader, BufWriter, ErrorKind, Read, Write},
  path::PathBuf,
  str::FromStr,
  sync::{
    LazyLock, OnceLock,
    atomic::{AtomicU64, Ordering},
  },
  time::Duration,
};
use uuid::Uuid;

static ANIMEBOX_CONFIG: &str = "animebox.ron";
static DEBOUNCE: LazyLock<AtomicU64> = LazyLock::new(|| AtomicU64::new(0));

pub static CONFIG_PATH: OnceLock<String> = OnceLock::new();

impl AnimeBoxConfig {
  pub fn init_config(path: String) -> anyhow::Result<AnimeBoxConfig> {
    let mut config_path = PathBuf::from_str(CONFIG_PATH.get_or_init(|| path).as_str())?;
    create_dir_all(&config_path)?;

    config_path.push(ANIMEBOX_CONFIG);

    let file = match File::open(&config_path) {
      Ok(file) => file,
      Err(error) => match error.kind() {
        ErrorKind::NotFound => {
          debug!("Config file is not present; creating config with default values");
          let config = Self::default();
          Self::write_config_to_file(&config, &config_path)?;
          return Ok(config);
        }
        e => {
          return Err(anyhow::anyhow!("While opening config file: {e}"));
        }
      },
    };

    let mut reader = BufReader::new(file);

    let mut contents = String::new();
    reader.read_to_string(&mut contents)?;

    let mut config: AnimeBoxConfig = match ron::from_str(contents.as_str()) {
      Ok(config) => config,
      Err(error) => {
        error!("While deserializing config: {error}");
        return Err(error.into());
      }
    };

    for i in 0..config.servers.servers.len() {
      if config.servers.servers[i].uuid.is_empty()
        || Uuid::try_parse(config.servers.servers[i].uuid.as_str()).is_err()
      {
        config.servers.servers.remove(0);
      }
    }

    Ok(config)
  }

  pub async fn update(&self) -> anyhow::Result<()> {
    if CONFIG_PATH.get().is_none() {
      return Err(anyhow::anyhow!("Config path is uninitialized"));
    }

    let id = DEBOUNCE.fetch_add(1, Ordering::SeqCst) + 1;
    tokio::time::sleep(Duration::from_secs(5)).await;

    if id != DEBOUNCE.load(Ordering::SeqCst) {
      Ok(())
    } else {
      info!("Updating config");
      match CONFIG_PATH.get() {
        None => Err(anyhow::anyhow!("Config path is uninitialized")),
        Some(path) => self.write_config_to_file(&PathBuf::from_str(path)?.join(ANIMEBOX_CONFIG)),
      }
    }
  }

  #[frb(ignore)]
  fn write_config_to_file(&self, path: &PathBuf) -> anyhow::Result<()> {
    let file = File::create(path)?;
    let mut writer = BufWriter::new(file);

    let config = ron::ser::to_string_pretty(self, PRETTY_CONFIG.clone())?;

    writer.write_all(config.as_bytes())?;
    Ok(())
  }
}
