import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = "/settings";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('设置'),
      ),
      body: new Container(
        child: new Center(
          child: new Text('setttings'),
        )
      )
    );
  }
}