import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_test/util.dart';

class WebViewNew extends StatefulWidget {
  const WebViewNew({Key? key}) : super(key: key);

  @override
  State<WebViewNew> createState() => _WebViewNewState();
}

class _WebViewNewState extends State<WebViewNew> {
  late WebViewController zepWebViewController;
  String webUrl = "https://zep.us/play/25wBM6";
  bool isLaunchExternalBrowser = false;

  void initWebViewController() {
    zepWebViewController = getWebViewController();
    zepWebViewController.setNavigationDelegate(NavigationDelegate(
      onPageStarted: (String url) async {
        if (url.contains("openExternalBrowser=true")) {
          zepWebViewController.loadRequest(Uri.parse(webUrl));
          isLaunchExternalBrowser = true;
          return;
        }
      },
      onPageFinished: (String url) {
      },
    ));
    zepWebViewController.loadRequest(Uri.parse(webUrl));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
