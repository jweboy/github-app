import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewPage extends StatelessWidget {
  final String url;

  const WebviewPage({
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: new AppBar(
        title: new Text(url),
      ),
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
}
