import 'package:flutter/material.dart';
import 'package:todo/screens/todo-list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 左侧菜单
  Future<void> _showDialog() async {
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

  Drawer _showNavDrawer(BuildContext context) {
    var headerChild = new DrawerHeader(
      child: new Text('Header'),
    );

    ListTile genNavItem(String text, var icon , String routeName) {
      return new ListTile(
        title: new Text(text),
        leading: new Icon(icon),
        onTap: () {
          setState(() {
            // Navigator.pop(context);
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(routeName);
                    });
        },
      );
    }

    var navChildren = [
      headerChild,
      genNavItem('设置', Icons.settings ,'/settings'),
    ];

    ListView listview = new ListView(
      children: navChildren,
    );

    return new Drawer(
      child: listview,
    );
  }

  // render主体
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('todo-list'),
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
        drawer: _showNavDrawer(context),
        body: new TodoList(),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            color: const Color(0xFF00FF00),
            child: new TextField(),
          ),
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
