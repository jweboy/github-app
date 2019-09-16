import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:github/components/empty_data.dart';
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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    Application.requestUrl = 'https://github-trending-api.now.sh';
    asyncGetTrendings();
  }

  _handleItemTap(BuildContext context, dynamic params) {
    Application.router.navigateTo(
        context,
        Routes.repoDetail +
            '?author=${FluroCovert.stringEncode(params['author'])}&name=${FluroCovert.stringEncode(params['name'])}',
        transition: TransitionType.inFromRight);
  }

  Future<void> asyncGetTrendings() async {
    setState(() {
      _isLoading = true;
    });

    var resp = await Net.get('/repositories?language=javascript&since=weekly');

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
            : (items.length > 0
                ? ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return new RepositoryItem(
                        item: items[index],
                        onTap: () => _handleItemTap(context, items[index]),
                      );
                    },
                  )
                : EmptyData()),
      ),
    );
  }
}
