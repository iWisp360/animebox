import "dart:async";

import "package:flutter_inappwebview/flutter_inappwebview.dart";
import "package:oxanime/utilities/logs.dart";

class SourceYourUpload {
  static Future<String?> getVideoUrl(String sourceUrl) async {
    Completer<String?> completer = Completer();
    logger.i("Getting Video Static URL from YourUpload($sourceUrl)");
    var webview = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(sourceUrl)),
      onReceivedError: (controller, url, error) async {
        completer.complete(url.url.rawValue);
      },
    );
    await webview.run();
    while (!completer.isCompleted) {
      await Future.delayed(Duration(milliseconds: 250));
    }
    webview.dispose();
    return completer.future;
  }
}

class SourceStreamWish {
  static Future<String?> getVideoUrl(String sourceUrl) async {
    Completer<String?> completer = Completer();
    logger.i("Getting Video Static URL from StreamWish($sourceUrl)");
    final InAppWebViewController controller;
    var webview = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(sourceUrl)),
      onLoadStop: (controller, content) async {
        print(await controller.getHtml());
      },
    );
    await webview.run();
    while (!completer.isCompleted) {
      await Future.delayed(Duration(milliseconds: 250));
    }
    webview.dispose();
    return completer.future;
  }
}
