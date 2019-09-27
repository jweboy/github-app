import 'package:flutter/material.dart';
import 'package:github/components/spin.dart';
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
  final _key = UniqueKey();
  num _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }
  // Widget favoriteButton() {
  //   return FutureBuilder<WebViewController>(
  //       // future: _controller.future,
  //       builder: (BuildContext context,
  //           AsyncSnapshot<WebViewController> controller) {
  //     if (controller.hasData) {
  //       return FloatingActionButton(
  //         onPressed: () async {
  //           final String url = await controller.data.currentUrl();
  //           Scaffold.of(context).showSnackBar(
  //             SnackBar(content: Text('Favorited $url')),
  //           );
  //         }g
  //         child: const Icon(Icons.favorite),
  //       );
  //     }
  //     return Container();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: IndexedStack(
          index: _stackToView,
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: WebView(
                    key: _key,
                    initialUrl: widget.url,
                    onPageFinished: _handleLoad,
                  ),
                )
              ],
            ),
            Container(
              child: Center(
                child: Spin(),
              ),
            )
          ],
        ));
  }
}
