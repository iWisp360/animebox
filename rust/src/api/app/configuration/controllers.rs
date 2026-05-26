use crate::api::app::configuration::models::AnimeBoxConfig;
use flutter_rust_bridge::frb;
use log::{debug, error, info};
use ron::ser::PrettyConfig;
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

static ANIMEBOX_CONFIG: &str = "animebox.ron";
static DEBOUNCE: LazyLock<AtomicU64> = LazyLock::new(|| AtomicU64::new(0));

static CONFIG_PATH: OnceLock<String> = OnceLock::new();

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

    match ron::from_str(contents.as_str()) {
      Ok(config) => Ok(config),
      Err(error) => {
        error!("While deserializing config: {error}");
        Err(error.into())
      }
    }
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

    let config = ron::ser::to_string_pretty(self, PrettyConfig::new().indentor("  "))?;

    writer.write_all(config.as_bytes())?;
    Ok(())
  }
}
