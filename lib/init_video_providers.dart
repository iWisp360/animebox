import 'dart:async';

import 'package:animebox/src/rust/api/data/video_providers/streamwish.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class VideoProviders {
  static void initWebviewFunctions() {
    initStreamwishFetcherFunction(
      fetcher: (url) async {
        InAppWebViewController? inAppWebViewController;
        Completer completer = Completer();
        HeadlessInAppWebView inAppWebView = HeadlessInAppWebView(
          onWebViewCreated: (controller) {
            inAppWebViewController = controller;
          },
          onLoadStop: (controller, url) => completer.complete(url),
        );
        await inAppWebView.run();
        WebUri actualUrl = WebUri(url);
        await inAppWebViewController?.loadUrl(
          urlRequest: URLRequest(url: actualUrl),
        );

        actualUrl = await completer.future;
        await inAppWebView.dispose();

        return await inAppWebViewController?.getHtml() ?? "";
      },
    );
  }
}
