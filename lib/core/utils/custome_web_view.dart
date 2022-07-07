import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomeWebView extends StatefulWidget {
  final String? url;
  final String? title;

  const CustomeWebView({
    required this.url,
    required this.title,
  });

  @override
  State<CustomeWebView> createState() => _CustomeWebViewState();
}

class _CustomeWebViewState extends State<CustomeWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title ?? "-",
        ),
      ),
      body: WebView(
        initialUrl: widget.url ?? "-",
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
      ),
    );
  }
}
