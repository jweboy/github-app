import 'package:flutter/material.dart';

class ArrowItem extends StatelessWidget {
  const ArrowItem({
    Key key,
    @required this.title,
    this.icon,
    this.hasArrow,
    this.description: '',
    this.iconColor,
    this.avatarUrl: '',
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool hasArrow;
  final String description;
  final Color iconColor;
  final String avatarUrl;

  // TODO: 头像先单独写一个

  @override
  Widget build(BuildContext context) {
    print('dd>>> $description');
    return new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              // padding: const EdgeInsets.only(top: 2.0, bottom: 10.0),
              child: new ListTile(
                title: Text(title),
                // subtitle: description != null && Text(description),
                leading: avatarUrl != ''
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(avatarUrl),
                        radius: 30.0,
                      )
                    : Icon(
                        icon,
                        size: 24.0,
                        color: iconColor,
                      ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  // size: 16.0,
                ),
              ),
              decoration: new BoxDecoration(
                  border: new Border(
                      // top:new BorderSide(
                      //   color: Colors.grey[300],
                      // ),
                      bottom: new BorderSide(
                color: Colors.grey[300],
              ))),
            ),
          ],
        )
        // color: Colors.white,
        );
  }
}
