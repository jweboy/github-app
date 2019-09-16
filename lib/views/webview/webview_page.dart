import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// TODO: https://stackoverflow.com/questions/54698124/flutter-how-to-show-a-circularprogressindicator-before-webview-loads-de-page

class WebviewPage extends StatefulWidget {
  final String url;

  const WebviewPage({
    @required this.url,
  });

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  // final Completer<WebViewController> _controller =

  Widget favoriteButton() {
    return FutureBuilder<WebViewController>(
        // future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
      if (controller.hasData) {
        return FloatingActionButton(
          onPressed: () async {
            final String url = await controller.data.currentUrl();
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Favorited $url')),
            );
          },
          child: const Icon(Icons.favorite),
        );
      }
      return Container();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      floatingActionButton: favoriteButton(),
      body: WebView(
        initialUrl: widget.url,
        // onWebViewCreated: (WebViewController webViewController) {
        //   _controller.complete(webViewController);
        // },
        // url: url,
        // appBar: new AppBar(
        //   title: new Text(url),
        // ),
        // initialChild: Center(
        //   child: Text('data'),
        // ),
      ),
    );
  }
}
