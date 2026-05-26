pub trait Expirable {
  fn is_expired(&self) -> bool;
}
