import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://wa.me/01118529272?text=%D9%85%D8%B1%D8%AD%D8%A8%D8%A7%20'));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
