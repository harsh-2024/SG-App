// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'dart:async';

// class WebViewBlogs extends StatefulWidget {
//   String url;
//   WebViewBlogs({required this.url});

//   @override
//   _WebViewBlogsState createState() => _WebViewBlogsState();
// }

// class _WebViewBlogsState extends State<WebViewBlogs> {
//   Completer<WebViewController> _controller = Completer<WebViewController>();
//   late WebViewController webViewController;
//   @override
//   Widget build(BuildContext context) {
//     // print(widget.url)
//     return SafeArea(
//         child: Scaffold(
//       body: WebView(
//         navigationDelegate: (NavigationRequest req) {},

//         javascriptMode: JavascriptMode.unrestricted,
//         initialUrl: widget.url, //shop.teamsg.in
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller.complete(webViewController);
//         },
//       ),
//     ));
//   }
// }

import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartWebView extends StatefulWidget {
  const CartWebView({super.key});

  @override
  State<CartWebView> createState() => _CartWebViewState();
}

class _CartWebViewState extends State<CartWebView> {
  void initState() {
    super.initState();
    // Enable virtual display.
    if (defaultTargetPlatform == TargetPlatform.android) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://shop.teamsg.in/",
    );
  }
}
