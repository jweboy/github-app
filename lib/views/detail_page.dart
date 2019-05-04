import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github/components/arrow_item.dart';
import 'package:github/components/repository_item.dart';
import 'package:github/utils/net.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  @override
  void dispose() {
    super.dispose();
  }

  Map<String, dynamic> info = {
    'stargazers_count': 0,
    'watchers_count': 0,
    'forks_count': 0,
    'default_branch': 'master',
  };

  Future getRepositoryDetail() async {
    if(!mounted) {
      return;
    }
    
    Map<String, dynamic> resp = {};

    try {
      resp = await Net.get('/repos/reduxjs/redux');
    } catch(err) {

    }

    setState(() {        
      info = resp;
      print(info);
    });
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

  @override
  Widget build(BuildContext context) {
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
                      buildColumn(info['stargazers_count'], 'Stars'),
                      buildColumn(info['watchers_count'], 'Watchs'),
                      buildColumn(info['forks_count'], 'Forks'),
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
                child: new ArrowItem(title: info['language'],),
              ),
              new ArrowItem(title: info['default_branch'],),
              new ArrowItem(title: 'README',),
              // new Container(
              //   child: const WebView(
              //     initialUrl: 'https://baidu.com',
              //   ),
              // )
              // new Webview
          ],
        ),
      )
    );
  }
}