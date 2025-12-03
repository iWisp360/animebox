class MaRu with VideoSourceParameters {
  @override
  bool get needsAWebView => true;
}

class MegaParser with VideoSourceParameters {
  @override
  bool get needsAWebView => true;
}

class Netu with VideoSourceParameters {
  @override
  bool get needsAWebView => false;
}

class OkRuParser with VideoSourceParameters {
  @override
  bool get needsAWebView => false;
}

class StreamTape with VideoSourceParameters {
  @override
  bool get needsAWebView => false;
}

class StreamWish with VideoSourceParameters {
  @override
  bool get needsAWebView => true;
}

mixin VideoSourceParameters {
  bool get needsAWebView;
}

// In this context, a parser is the utility that brings you the content you need to watch a serie chapter,
// either by natively streaming it or embedding a webview player if getting a URL is not possible.
// A parser gets the following contents if available:
// - URL or a List of URLs of the static content of the video
// - Video Quality Options
// - Video Duration
enum VideoSourceParsers {
  yourUpload, // sourced from aniyomi
  streamTape, // sourced from aniyomi
  okru, // sourced from aniyomi
  mega, // video playback through webview. Will try downloading
  maru, // maybe
  netu, // maybe
  streamwish, // only webview, an actual implementation of a parser needs features not present in dart
}

class VideoSources {
  static List<String> getVideoSourceUrl(VideoSourceParsers videoSource) {
    return switch (videoSource) {
      VideoSourceParsers.yourUpload => ["yourupload.com"],
      VideoSourceParsers.mega => ["mega.nz", "mega.co.nz"],
      VideoSourceParsers.okru => ["ok.ru"],
      VideoSourceParsers.streamTape => ["streamtape.com"],
      VideoSourceParsers.maru => ["my.mail.ru"],
      VideoSourceParsers.netu => ["hqq.tv"],
      VideoSourceParsers.streamwish => ["streamwish.to"],
    };
  }
}
