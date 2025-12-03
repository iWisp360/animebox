import "package:html/parser.dart";
import "package:http/http.dart";
import "package:html/dom.dart";

class MaRu with VideoSourceParameters {
  @override
  bool get needsAWebView => true;
  Future<String?> getVideoFromUrl(final String url) async {}
}

class Mega with VideoSourceParameters {
  @override
  bool get needsAWebView => true;
  Future<String?> getVideoFromUrl(final String url) async {}
}

class Netu with VideoSourceParameters {
  @override
  bool get needsAWebView => false;
  Future<String?> getVideoFromUrl(final String url) async {}
}

class OkRu with VideoSourceParameters {
  @override
  bool get needsAWebView => false;
  Future<String?> getVideoFromUrl(final String url) async {}
}

class StreamTape with VideoSourceParameters {
  @override
  bool get needsAWebView => false;
  Future<String?> getVideoFromUrl(final String url) async {}
}

class StreamWish with VideoSourceParameters {
  @override
  bool get needsAWebView => true;
  Future<String?> getVideoFromUrl(final String url) async {}
}

// Working
class YourUpload with VideoSourceParameters {
  @override
  bool get needsAWebView => false;

  @override
  Future<String?> getVideoFromUrl(final String url) async {
    const startMark = "file: '";
    const endMark = "',";

    final request = Request("GET", Uri.parse(url));
    request.headers["referer"] = VideoSources.getCompleteUrl(
      VideoSources.videoSourcesDomainNames(VideoSourceParsers.yourUpload)[0],
    );

    final client = Client();
    final response = await Response.fromStream(await client.send(request));
    final Element elementSelectFirst = HtmlParser(response.body)
        .parse()
        .querySelectorAll("script")
        .firstWhere((element) => element.text.contains("jwplayerOptions"));
    final String strData = elementSelectFirst.text;
    if (strData.isEmpty) {
      return null;
    } else {
      int startOfUrlIndex = strData.indexOf(startMark);
      int endOfUrlIndex = strData.indexOf(endMark);
      return strData.substring(startOfUrlIndex + startMark.length, endOfUrlIndex);
    }
  }
}

mixin VideoSourceParameters {
  bool get needsAWebView;
  Future<String?> getVideoFromUrl(final String url);
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
  static String getCompleteUrl(final String domainName) {
    return "https://$domainName/";
  }

  static List<String> videoSourcesDomainNames(VideoSourceParsers videoSource) {
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
