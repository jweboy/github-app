import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: ListTile(
                title: Text('清除缓存 0.00MB'),
                trailing: Icon(Icons.keyboard_arrow_right)),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(color: Colors.grey[300]),
                  bottom: BorderSide(color: Colors.grey[300])),
            ),
          ),
        ],
      ),
    );
  }
}
