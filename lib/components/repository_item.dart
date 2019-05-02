import 'package:flutter/material.dart';

class RepositoryItem extends StatelessWidget{
   const RepositoryItem({
    Key key,
    @required this.item,
    this.handleTapEvent,
  }): super(key: key);

  final Map<String, dynamic> item;
  final VoidCallback handleTapEvent;

  Widget createTimeWidget() {
    return new Row(
      children: <Widget>[
        new Text('${item["created_at"]}'),
      ],
    );
  }

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
              new Text('${item["language"]}')
            ],
          ),
          margin: new EdgeInsets.only(right: 10.0),
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Icon(Icons.star, size: 14.0),
              new Text('${item["stargazers_count"]}')
            ],
          ),
          margin: new EdgeInsets.only(right: 10.0),
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Icon(Icons.code, size: 14.0,),
              new Text('${item["forks_count"]}')
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
            '${item["full_name"]}',
            style: new TextStyle(
              color: Colors.blue,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage('${item['owner']['avatar_url']}'),
          ),
          subtitle: Text('${item["description"]}'),
          trailing: Text('count'),
          onTap: handleTapEvent,
        ),
        new Container(
          padding: new EdgeInsets.fromLTRB(70.0, 5.0, 0, 5.0),
          child: new Column(
            children: <Widget>[
              createTimeWidget(),
              statisticsWidget(),
            ],
          ),
        )
      ],
    );
  }
}