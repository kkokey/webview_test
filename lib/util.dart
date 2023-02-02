import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

WebViewController? globalWebViewController;

WebViewController getWebViewController() {
  late final PlatformWebViewControllerCreationParams params;
  if (WebViewPlatform.instance is WebKitWebViewPlatform) {
    params = WebKitWebViewControllerCreationParams(
      allowsInlineMediaPlayback: true,
      mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
    );
  } else {
    params = const PlatformWebViewControllerCreationParams();
  }
  if (Platform.isAndroid) {
    globalWebViewController = WebViewController.fromPlatformCreationParams(
        AndroidWebViewControllerCreationParams());
  } else {
    globalWebViewController =
        WebViewController.fromPlatformCreationParams(params);
  }
  globalWebViewController!.setJavaScriptMode(JavaScriptMode.unrestricted);
  return globalWebViewController!;
}
