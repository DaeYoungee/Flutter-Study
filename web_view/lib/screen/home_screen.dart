import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final uri = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()..loadRequest(uri);
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
