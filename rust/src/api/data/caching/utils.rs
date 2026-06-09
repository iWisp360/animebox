use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use std::{
  fs::{File, create_dir_all},
  io::{self, BufReader, BufWriter, Read, Write},
  path::PathBuf,
  sync::LazyLock,
  time::Duration,
};

static CACHE_TTL: LazyLock<Duration> = LazyLock::new(|| Duration::from_hours(48));

pub trait CacheSource: for<'a> Deserialize<'a> + Serialize + ReadWrite + Default {
  fn init() -> anyhow::Result<Self>
  where
    Self: Sized,
  {
    let contents = Self::read_from_file();
    match contents {
      Ok(contents) => Ok(ron::from_str(contents.as_str()).unwrap_or_default()),
      Err(error) => match error.kind() {
        io::ErrorKind::NotFound => {
          let new_cache = Self::default();
          new_cache.write_to_file()?;
          Ok(new_cache)
        }

        _ => Err(error.into()),
      },
    }
  }

  fn update(&self) -> anyhow::Result<(), io::Error> {
    self.write_to_file()
  }
}

pub trait ReadWrite: GetPath + ToString {
  fn read_from_file() -> anyhow::Result<String, io::Error> {
    let path = Self::origin_path()?;

    let file = File::open(path)?;
    let mut reader = BufReader::new(file);
    let mut contents = String::new();

    reader.read_to_string(&mut contents)?;

    Ok(contents)
  }
  fn write_to_file(&self) -> anyhow::Result<(), io::Error> {
    let path = PathBuf::from(Self::origin_path()?);

    if let Some(parent) = path.parent() {
      create_dir_all(parent)?;
    }

    let file = File::create(path)?;
    let mut writer = BufWriter::new(file);
    let contents = self.to_string();

    writer.write_all(contents.as_bytes())
  }
}

pub trait GetPath {
  fn origin_path() -> anyhow::Result<String, io::Error>;
}

pub trait Expirable {
  fn is_expired(&self) -> bool {
    let nanoseconds = 0;
    let date = DateTime::from_timestamp(self.get_expiration_date(), nanoseconds);

    if let Some(date) = date {
      date + *CACHE_TTL <= Utc::now()
    } else {
      false
    }
  }
  fn get_expiration_date(&self) -> i64;
}
