use flutter_rust_bridge::frb;
use reqwest::Client;
use std::sync::LazyLock;

#[frb(ignore)]
pub static CLIENT: LazyLock<Client> = LazyLock::new(Client::new);
