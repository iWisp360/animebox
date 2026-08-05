pub mod app;
pub mod data;
pub mod server;
pub mod translations;

///
/// ```
///
/// pub enum ConfigError {
///   InputOutput(String),
///   Infallible(String),
///   RonSpanned(String),
///   Ron(String),
/// }
///
/// impl_from_string_representation!(
///   ConfigError,
///   (Ron, ron::Error),
///   (RonSpanned, ron::de::SpannedError),
///   (InputOutput, io::Error),
///   (Infallible, std::convert::Infallible)
/// );
/// ```
///
///
#[macro_export]
macro_rules! impl_string_representation {
  ($struct:ty, $(($member:ident, $representee:ty)$(,)?)*) => {
    $(
      impl From<$representee> for $struct {
        fn from(value: $representee) -> Self {
          Self::$member(value.to_string())
        }
      }
    )*
  };
}
