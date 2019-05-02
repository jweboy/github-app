import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github/components/arrow_item.dart';
import 'package:github/components/repository_item.dart';
import 'package:github/utils/net.dart';

class DetailPage extends StatefulWidget {
  static const String routeName = "/detail";

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();

    getRepositoryDetail();
  }

  var detail;

  Future getRepositoryDetail() async {
    if(mounted) {
      // var data = await Net.get('/repos/reduxjs/redux');
      // detail = data;
    }
  }


  Column buildColumn(int count, String title) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            '$count', 
            style: new TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.0
            ),
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new Text(
            title, 
            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.grey[700]
            ),
          ),
        )
      ],
    );
  }

  var data = [];

  getListData() {
    List<Widget> widgets = [];
    for (int i=0; i<100; i++) {
      widgets.add(
        new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new Text('Row $i'))
      );
    }

    // for (int i = 0; i < data.length; i++) {
    //   widgets.add(new Text("data"));
    // }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    var divivedWidgetList = ListTile.divideTiles(
      context: context,
      tiles: getListData(),
    );
      
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Repository'),
      ),
      body: new Container(
        color: Colors.grey[200],
        child: new Column(
          children: <Widget>[
              // ListView.separated(
              //   separatorBuilder: (BuildContext context, int index) => Divider(),
              //   itemCount: 1,
              //   itemBuilder: (conetxt, index) {
              //     return new RepositoryItem(item: detail,);
              //   },
              // ),
              new Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                color: Colors.white,
                child: new Container(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buildColumn(13, 'Stars'),
                      buildColumn(14, 'Watchs'),
                      buildColumn(15, 'Forks'),
                    ],
                  ),
                  decoration: new BoxDecoration(
                    border: new Border(
                      bottom: new BorderSide(
                        color: Colors.grey[300],
                      )
                    )
                  ),
                )
              ),
              new ArrowItem(title: 'Pull Requests',),
              new ArrowItem(title: 'Issues',),
              new Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: new ArrowItem(title: 'Language',),
              ),
              new ArrowItem(title: 'Branch',),
              new ArrowItem(title: 'README',),
          ],
        ),
      )
    );
  }
}