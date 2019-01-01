import 'package:flutter/material.dart';

class BasicHomePage extends StatefulWidget {
  @override
  _BasicHomePageState createState() => new _BasicHomePageState();
}

class _BasicHomePageState extends State<BasicHomePage> {
  // 左侧菜单
  Future<void> _showDrawer() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('confirm'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // render主体
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('todo-list'),
          leading: new IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              return _showDrawer();
            },
          ),
          actions: <Widget>[
            new PopupMenuButton<Choice>(
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return new PopupMenuItem<Choice>(
                    value: choice,
                    child: new Text(choice.title),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: null,
      ),
    );
  }
}

class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '排序', icon: Icons.directions_car),
  const Choice(title: '主题样式')
];
