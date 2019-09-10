import 'package:flutter/material.dart';
import 'package:github/utils/net.dart';
import 'package:github/components/repository_item.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  List items = new List();

  @override
  void initState() {
    super.initState();
    asyncGetTrendings();
  }

  Future<List> asyncGetTrendings() async {
    items = await Net.get(
        'https://github-trending-api.now.sh/repositories?language=javascript&since=weekly');

    print(items);
    return items;
    // setState(() {
    //   items;
    //   return null;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: Text('Repositories'),
      // ),
      body: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new RepositoryItem(
              item: items[index],
            );
          },
        ),
        // child: new Text('haha'),
      ),
      // bottomNavigationBar: new NavigationBar(),
    );
  }
}
