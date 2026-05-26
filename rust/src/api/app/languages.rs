use serde::{Deserialize, Serialize};

#[derive(Deserialize, Serialize, Clone, Default)]
pub enum AppLanguages {
  ES,
  JP,
  #[default]
  EN,
  RU,
  ZH,
  AR,
}
