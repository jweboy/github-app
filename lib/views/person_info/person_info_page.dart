import 'package:flutter/material.dart';
import 'package:github/components/list_item.dart';
import 'package:github/routes/routes.dart';
import 'package:github/utils/application.dart';
import 'package:github/utils/fluro_covert.dart';

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

  _handleListItemTap(BuildContext context, String label, String value) {
    Application.router.navigateTo(
        context,
        Routes.editPersonInfo +
            '?label=${FluroCovert.stringEncode(label)}&value=${FluroCovert.stringEncode(value)}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        leading: BackButton(),
      ),
      body: Column(
        children: <Widget>[
          ListItem(
            iconText: '姓名',
            title: name,
            hasArrow: true,
            onTap: () => _handleListItemTap(context, '姓名', name),
          ),
          ListItem(
            iconText: '简介',
            title: description,
            hasArrow: true,
            hasTopBorder: false,
            onTap: () => _handleListItemTap(context, '简介', description),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                ListItem(
                  iconText: '团队',
                  title: company,
                  hasArrow: true,
                  onTap: () => _handleListItemTap(context, '团队', company),
                ),
                ListItem(
                  iconText: '地址',
                  title: location,
                  hasArrow: true,
                  hasTopBorder: false,
                  onTap: () => _handleListItemTap(context, '地址', location),
                ),
                ListItem(
                  iconText: '个人主页',
                  title: blog,
                  hasArrow: true,
                  hasTopBorder: false,
                  onTap: () => _handleListItemTap(context, '个人主页', blog),
                ),
              ],
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //   color: Colors.red,
          //   child: RaisedButton(
          //     child: Text(
          //       '退出',
          //       style: TextStyle(
          //           color: Colors.red[500],
          //           fontWeight: FontWeight.w600,
          //           fontSize: 18.0),
          //     ),
          //     onPressed: () => {},
          //   ),
          // )
        ],
      ),
    );
  }
}
