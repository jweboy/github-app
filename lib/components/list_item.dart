import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.title,
    this.icon,
    this.hasArrow: false,
    this.hasTopBorder: true,
    this.hasBottomBorder: true,
    // this.description: '',
    this.iconColor,
    this.avatarUrl: '',
    this.padding,
    this.iconText: '',
    this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool hasArrow;
  // final String description;
  final Color iconColor;
  final String avatarUrl;
  final bool hasTopBorder;
  final bool hasBottomBorder;
  final EdgeInsets padding;
  final String iconText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: padding != null ? padding : null,
              child: new ListTile(
                title: Text(title),
                // subtitle: description != null ? Text(description) : null,
                leading: iconText == ''
                    ? Icon(
                        icon,
                        size: 24.0,
                        color: iconColor,
                      )
                    : Text(
                        iconText,
                        style:
                            TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                trailing: Icon(
                  hasArrow ? Icons.keyboard_arrow_right : null,
                ),
                onTap: onTap,
              ),
              decoration: BoxDecoration(
                  border: Border(
                      top: hasTopBorder
                          ? BorderSide(color: Colors.grey[300])
                          : BorderSide(color: Colors.white),
                      bottom: hasBottomBorder
                          ? BorderSide(
                              color: Colors.grey[300],
                            )
                          : BorderSide(color: Colors.white))),
            ),
          ],
        )
        // color: Colors.white,
        );
  }
}
