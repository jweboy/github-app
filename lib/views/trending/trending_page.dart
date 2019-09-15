import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:github/components/spin.dart';
import 'package:github/routes/routes.dart';
import 'package:github/utils/application.dart';
import 'package:github/utils/net.dart';
import 'package:github/components/repository_item.dart';
import 'package:github/utils/fluro_covert.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  List items = new List();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    asyncGetTrendings();
  }

  _handleItemTap(BuildContext context, dynamic params) {
    Application.router.navigateTo(
        context,
        Routes.repoDetail +
            '?author=${FluroCovert.stringEncode(params['author'])}&name=${FluroCovert.stringEncode(params['name'])}');
  }

  Future<void> asyncGetTrendings() async {
    var resp = await Net.get(
        'https://github-trending-api.now.sh/repositories?language=javascript&since=weekly');

    // print('items >>> $items');

    setState(() {
      _isLoading = false;
      items = resp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: _isLoading
            ? Spin()
            : ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return new RepositoryItem(
                    item: items[index],
                    onTap: () => _handleItemTap(context, items[index]),
                  );
                },
              ),
        // child: new Text('haha'),
      ),
    );
  }
}
