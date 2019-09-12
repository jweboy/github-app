import 'package:flutter/material.dart';
import 'package:github/components/arrow_item.dart';
import 'package:github/utils/net.dart';

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

  static Column buildStatistics(int count, String title) {
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
    print('profile >>> $profile');

    return new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new ArrowItem(
            title: profile['name'] + '(${profile['login']})',
            description:
                profile['bio'] + '\nJoined on ${profile['created_at']}',
            avatarUrl: profile['avatar_url'],
          ),
          new Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            color: Colors.white,
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
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                new ArrowItem(
                  title: profile['company'],
                  iconColor: Colors.blueAccent,
                  icon: Icons.people,
                ),
                new ArrowItem(
                  title: profile['location'],
                  iconColor: Colors.teal,
                  icon: Icons.location_city,
                ),
                new ArrowItem(
                  title: profile['blog'],
                  iconColor: Colors.purpleAccent,
                  icon: Icons.link,
                )
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                new ArrowItem(
                  title: settingsText,
                  icon: Icons.settings,
                  iconColor: Colors.blueGrey,
                ),
                new ArrowItem(
                  title: aboutText,
                  icon: Icons.info,
                  iconColor: Colors.orange,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
