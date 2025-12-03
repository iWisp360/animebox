class VideoSourceScripts {
  static final String getVideoUrlGeneric = """
    (() => {
      const video = document.querySelector("video");
      return video ? video.src : null;
    })();
  """;
  static final String clickPlayYourUpload = """
    (() => {
      const btn = document.querySelector(".jw-icon-play");
      if (btn) {
        btn.click();
      }
    })();
  """;
  static final String getVideoUrlYourUpload = """
  let videoSrc = null;
  const regex = /https?:\/\/vidcache\\.net:\\d{4}\\/[^"']+/;
  const foundUrl = document.body.innerHTML.match(regex);
  if (foundUrl) {
    videoSrc = foundUrl[0]; // Get the first match
  }
  return videoSrc;
  """;
}
