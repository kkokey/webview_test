import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_test/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController webViewController;

  void initWebViewController() {
    webViewController = getWebViewController();
    webViewController.setNavigationDelegate(NavigationDelegate(
      onPageStarted: (String url) {},
      onPageFinished: (String url) {
      },
    ));

    webViewController.addJavaScriptChannel('Native',
        onMessageReceived: fromJavascript);
    webViewController.loadRequest(Uri.parse("https://zep.us/play/8MR7np"));
  }

  void fromJavascript(JavaScriptMessage message) async {
    print('fromJavascript: ${message.message}');
  }
  
  @override
  void initState() {
    initWebViewController();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: webViewController),
    );
  }
}
