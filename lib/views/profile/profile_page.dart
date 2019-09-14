import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:github/components/list_item.dart';
import 'package:github/routes/routes.dart';
import 'package:github/utils/application.dart';
import 'package:github/utils/net.dart';
import 'package:github/views/profile/avatar_item.dart';
import 'package:github/utils/fluro_covert.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> profile = {
    "company": '',
    "location": '',
    "blog": '',
    "login": '',
    'name': '',
    'bio': '',
    'avatar_url': '',
    'created_at': 'created_at',
    "public_repos": 0,
    "followers": 0,
    "following": 0,
  };
  static final String settingsText = '设置';
  static final String aboutText = '关于';

  // @override
  void initState() {
    super.initState();

    asyncGetProfileData();
  }

  Future<void> asyncGetProfileData() async {
    var data = await Net.get('https://api.github.com/users/jweboy');

    setState(() {
      profile = data;
    });
  }

  static Widget buildStatistics(int count, String title) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            '$count',
            style: new TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new Text(
            title,
            style: new TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700]),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('profile >>> $profile');

    _handleAvatarItemTap(BuildContext context) {
      Application.router.navigateTo(
          context,
          Routes.personInfo +
              '?name=${profile['name']}&description=${FluroCovert.stringEncode(profile['bio'])}&company=${FluroCovert.stringEncode(profile['company'])}&location=${profile['location']}&blog=${FluroCovert.stringEncode(profile['blog'])}',
          transition: TransitionType.inFromRight);
    }

    _handleListItemTap(BuildContext context, String path) {
      Application.router
          .navigateTo(context, path, transition: TransitionType.inFromRight);
    }

    return new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new AvatarItem(
            title: profile['name'] + '(${profile['login']})',
            description:
                profile['bio'] + '\nJoined on ${profile['created_at']}',
            avatarUrl: profile['avatar_url'],
            onTap: () => _handleAvatarItemTap(context),
          ),
          new Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey[300]))),
            margin: const EdgeInsets.only(bottom: 10.0),
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildStatistics(profile['public_repos'], 'Repositories'),
                buildStatistics(profile['followers'], 'Followers'),
                buildStatistics(profile['following'], 'Following'),
              ],
            ),
          ),
          new Container(
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                new ListItem(
                  title: profile['company'],
                  iconColor: Colors.blueAccent,
                  icon: Icons.people,
                  hasTopBorder: true,
                ),
                new ListItem(
                  title: profile['location'],
                  iconColor: Colors.teal,
                  icon: Icons.location_city,
                  hasTopBorder: false,
                ),
                new ListItem(
                  title: profile['blog'],
                  iconColor: Colors.purpleAccent,
                  icon: Icons.link,
                  hasArrow: true,
                  hasTopBorder: false,
                  onTap: () => _handleListItemTap(
                      context,
                      Routes.webview +
                          '?url=${FluroCovert.stringEncode(profile['blog'])}'),
                )
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                new ListItem(
                  title: settingsText,
                  icon: Icons.settings,
                  iconColor: Colors.blueGrey,
                  hasArrow: true,
                  onTap: () => _handleListItemTap(context, Routes.settings),
                ),
                new ListItem(
                  title: aboutText,
                  icon: Icons.info,
                  iconColor: Colors.orange,
                  hasArrow: true,
                  hasTopBorder: false,
                  onTap: () => _handleListItemTap(context, Routes.about),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
