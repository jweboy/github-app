import 'package:flutter/material.dart';

// TODO:状态小角标

class RepositoryItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const RepositoryItem({
    Key key,
    @required this.item,
    this.onTap,
  }) : super(key: key);

  // 组件信息小组件
  Widget statisticsWidget() {
    return new Row(
      children: <Widget>[
        new Container(
          child: new Row(
            children: <Widget>[
              // new Container(
              //   decoration: new BoxDecoration(
              //     color: Colors.red[400],
              //     borderRadius: new BorderRadius.all(
              //       const Radius.circular(4.0)
              //     )
              //   ),
              // ),
              new Text(item["language"])
            ],
          ),
          margin: new EdgeInsets.only(right: 10.0),
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Icon(Icons.star, color: Colors.yellow, size: 16.0),
              new Text("${item["stars"]}")
            ],
          ),
          margin: new EdgeInsets.only(right: 10.0),
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Icon(Icons.call_split, size: 16.0),
              new Text("${item["forks"]}")
            ],
          ),
          margin: new EdgeInsets.only(right: 10.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new ListTile(
          title: new Text(
            '${item["name"]}',
            style: new TextStyle(
              color: Colors.blue,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: new NetworkImage('${item['avatar']}'),
          ),
          subtitle: new Text('${item["description"]}'),
          //   trailing: Text('count'),
          onTap: onTap,
        ),
        new Container(
          padding: new EdgeInsets.fromLTRB(70.0, 5.0, 0, 5.0),
          child: new Column(
            children: <Widget>[
              // createTimeWidget(),
              statisticsWidget(),
            ],
          ),
        )
      ],
    );
  }
}
