import 'package:flutter/material.dart';
import 'package:github/utils/net.dart';
import 'package:github/components/pull_refresh.dart' as refreshComponent;
import 'package:github/components/repository_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }): super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VoidCallback navigateToDetailPage() {
    setState(() {
      // Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/detail');
    });

    return null;
  }

  Future<Map> getOwnerRepositoryData([Map<String, dynamic> params]) async {
    var responseList = [];
    var pageTotal = 100;
    var pageIndex = (params is Map) ? params['pageIndex'] : 0;

    try {
      responseList = await Net.get('/users/jweboy/starred');
    } catch(err) {
      // TODO: handle error
    }

    pageIndex += 1;

    Map<String, dynamic> result = {
      'list': responseList,
      'total': pageTotal,
      'pageIndex': pageIndex,
    };

    return result;
  }

  Widget renderListItem(index, item){
    return new RepositoryItem(
      item: item,
      handleTapEvent: navigateToDetailPage,
    );
  }

  // render主体
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('github'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Expanded(
                child: refreshComponent.ListRefresh(
                  getOwnerRepositoryData,
                  renderListItem
                ),
              )
            ],
          ),
        ),
      );
    }
  }