use log::LevelFilter;
use log4rs::{
  Config, Handle,
  append::file::FileAppender,
  config::{Appender, Root},
};
use serde::{Deserialize, Serialize};
use std::{io, sync::OnceLock};

pub struct CoreLoggerSettings {
  pub path: String,
  pub level: LogLevel,
}

#[derive(Deserialize, Serialize, Clone, Copy)]
pub enum LogLevel {
  Info,
  Debug,
}

#[derive(thiserror::Error, Debug)]
pub enum LoggerError {
  #[error("The logger implementation failed: {0}")]
  SetLogger(#[from] log::SetLoggerError),
  #[error("I/O error: {0}")]
  InputOutput(#[from] io::Error),
  #[error("Logger configuration error: {0}")]
  LoggerConfig(#[from] log4rs::config::runtime::ConfigErrors),
}

static LOGGER_HANDLE: OnceLock<Handle> = OnceLock::new();

pub fn init_logger(settings: CoreLoggerSettings) -> Result<(), LoggerError> {
  if LOGGER_HANDLE.get().is_none() {
    LOGGER_HANDLE
      .set(log4rs::init_config(
        Config::builder()
          .appender(Appender::builder().build(
            "main",
            Box::new(FileAppender::builder().append(false).build(settings.path)?),
          ))
          .build(
            Root::builder()
              .appender("main")
              .build(match settings.level {
                LogLevel::Debug => LevelFilter::Debug,
                LogLevel::Info => LevelFilter::Info,
              }),
          )?,
      )?)
      .unwrap();
  }

  Ok(())
}
