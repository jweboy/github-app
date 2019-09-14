import 'package:flutter/material.dart';
import 'package:github/components/list_item.dart';
import 'package:github/utils/application.dart';

class PersonInfoPage extends StatelessWidget {
  PersonInfoPage({
    Key key,
    this.name,
    this.description,
    this.company,
    this.location,
    this.blog,
  }) : super(key: key);

  final String name;
  final String description;
  final String company;
  final String location;
  final String blog;

  _handleLeadingTap(BuildContext context) {
    Application.router.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => _handleLeadingTap(context),
        ),
      ),
      body: Column(
        children: <Widget>[
          ListItem(
            iconText: '姓名',
            title: name,
            hasArrow: true,
          ),
          ListItem(
            iconText: '简介',
            title: description,
            hasArrow: true,
            hasTopBorder: false,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                ListItem(
                  iconText: '团队',
                  title: company,
                  hasArrow: true,
                ),
                ListItem(
                  iconText: '地址',
                  title: location,
                  hasArrow: true,
                  hasTopBorder: false,
                ),
                ListItem(
                  iconText: '个人主页',
                  title: blog,
                  hasArrow: true,
                  hasTopBorder: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
