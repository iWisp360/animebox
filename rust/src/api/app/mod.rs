use std::sync::LazyLock;

use ron::ser::PrettyConfig;

pub mod configuration;
pub mod languages;
pub mod logging;
pub mod sections;
pub mod themes;

pub static PRETTY_CONFIG: LazyLock<PrettyConfig> =
  LazyLock::new(|| PrettyConfig::new().indentor("  "));
