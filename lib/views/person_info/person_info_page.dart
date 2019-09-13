import 'package:flutter/material.dart';
import 'package:github/components/list_item.dart';
import 'package:github/utils/application.dart';

class PersonInfoPage extends StatefulWidget {
  const PersonInfoPage({
    Key key,
    this.name,
  }) : super(key: key);

  final String name;

  @override
  _PersonInfoPageState createState() => _PersonInfoPageState();
}

class _PersonInfoPageState extends State<PersonInfoPage> {
  _handleLeadingTap(BuildContext context) {
    Application.router.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // print('personInfo >>  $name');
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => _handleLeadingTap(context),
        ),
      ),
      body: Column(
        children: <Widget>[
          ListItem(
            title: '姓名',
            hasArrow: true,
            iconText: '姓名',
          ),
          ListItem(
            title: '简介',
            hasArrow: true,
            hasTopBorder: false,
            iconText: '简介',
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                ListItem(
                  title: '团队',
                  hasArrow: true,
                  iconText: '团队',
                ),
                ListItem(
                  title: '地址',
                  hasArrow: true,
                  hasTopBorder: false,
                  iconText: '地址',
                ),
                ListItem(
                  title: '个人主页',
                  hasArrow: true,
                  hasTopBorder: false,
                  iconText: '个人主页',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
