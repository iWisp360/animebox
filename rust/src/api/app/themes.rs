use serde::{Deserialize, Serialize};

#[derive(Deserialize, Serialize, Default, Clone)]
pub enum Themes {
  #[default]
  Dynamic,
  CatppuccinLatte,
  CatppuccinFrappe,
  CatppuccinMacchiato,
  CatppuccinMocha,
  Nord,
  TokyoNight,
  Matrix,
  Monochrome,
}

#[derive(Deserialize, Serialize, Default, Clone)]
pub enum ThemeModes {
  #[default]
  System,
  Dark,
  Light,
}
