import 'package:flutter/material.dart';
import 'package:github/utils/net.dart';
import 'package:github/components/repository_item.dart';
import 'package:github/components/navigation_bar.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  List items = new List();
  
  @override
  void initState() {
    super.initState();
    asyncGetTrendings();
  }
  
  Future<List> asyncGetTrendings() async {

    items = await Net.get('https://github-trending-api.now.sh/repositories?language=javascript&since=weekly');

    print(items);
    return items;
    // setState(() {
    //   items;
    //   return null;
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Repositories'),
        ),
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
        ),
        bottomNavigationBar: new NavigationBar(),
    );
  }
}