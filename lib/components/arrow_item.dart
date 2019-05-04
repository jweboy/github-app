import 'package:flutter/material.dart';

class ArrowItem extends StatelessWidget {
  const ArrowItem({
    Key key,
    @required this.title,
    this.icon,
  }) : super(key: key);

  final String title;
  final String icon;
  // final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            child: new ListTile(
              title: new Text(title),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
              ),
              trailing: new Icon(
                Icons.keyboard_arrow_right
              ),
            ),
            decoration: new BoxDecoration(
              border: new Border(
                // top:new BorderSide(
                //   color: Colors.grey[300],
                // ),
                bottom: new BorderSide(
                  color: Colors.grey[300],
                )
              )
            ),
          ),
        ],
      )
      // color: Colors.white,
    );
  }
}