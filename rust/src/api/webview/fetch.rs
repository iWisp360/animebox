use flutter_rust_bridge::{DartFnFuture, frb};
use log::{debug, error};

#[cfg(target_os = "linux")]
#[frb(ignore)]
pub fn get_browser() -> anyhow::Result<headless_chrome::Browser> {
  use headless_chrome::Browser;
  use std::{
    sync::{LazyLock, Mutex},
    thread::{self},
    time::{Duration, Instant},
  };

  static LAST_USE: Mutex<Option<Instant>> = Mutex::new(None);
  static BROWSER: LazyLock<Mutex<Option<Browser>>> = LazyLock::new(|| Mutex::new(None));
  let mut browser = BROWSER
    .lock()
    .map_err(|e| anyhow::anyhow!("While locking browser mutex: {e}"))?;

  *LAST_USE
    .lock()
    .map_err(|e| anyhow::anyhow!("While locking last_use mutex: {e}"))? =
    Some(Instant::now() + Duration::from_mins(5));

  // Safety countermeasure when chromium is externally closed
  if let Some(inner_browser) = &*browser {
    if let Err(error) = inner_browser.get_version() {
      debug!(
        "While checking life of browser: {error}. This is expected(I think). Creating browser again."
      );
      *browser = None;
    }
  }

  match &*browser {
    Some(browser) => Ok(browser.clone()),
    None => {
      let inner_browser = Browser::default()?;
      *browser = Some(inner_browser.clone());
      drop(browser);
      thread::spawn(move || {
        loop {
          thread::sleep(Duration::from_secs(10));
          let last_use = match LAST_USE.lock() {
            Ok(last_use) => last_use,
            Err(error) => {
              error!("Couldn't lock LAST_USE mutex: {error}");
              continue;
            }
          };

          let Some(last_use) = *last_use else { continue };
          if Instant::now() < last_use {
            continue;
          }

          let mut browser = match BROWSER.lock() {
            Ok(browser) => browser,
            Err(error) => {
              error!("Couldn't lock BROWSER mutex: {error}");
              continue;
            }
          };

          debug!("Dropping browser because it wasn't being used for too long");
          *browser = None;
          break;
        }
      });

      Ok(inner_browser)
    }
  }
}

#[frb(ignore)]
pub async fn get_content(
  url: String,
  #[allow(unused_variables)] fetcher: impl Fn(String) -> DartFnFuture<String> + Send + Sync + 'static,
) -> anyhow::Result<String> {
  #[cfg(target_os = "linux")]
  {
    let browser = get_browser()?;
    debug!("Starting new tab");
    let tab = browser.new_tab()?;

    tab.navigate_to(url.as_str())?;

    let class = ".overdiv";
    debug!("Waiting for element {class}");

    tab.wait_for_element(class)?;

    debug!("Getting DOM content");
    tab.get_content()
  }
  #[cfg(not(target_os = "linux"))]
  {
    debug!("Calling externally provided fetcher");
    Ok(fetcher(url).await)
  }
}
