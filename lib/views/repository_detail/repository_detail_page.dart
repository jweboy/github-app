import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github/components/list_item.dart';
import 'package:github/components/spin.dart';
import 'package:github/components/statistics_block.dart';
import 'package:github/routes/routes.dart';
import 'package:github/utils/application.dart';
import 'package:github/utils/net.dart';
import 'package:github/views/profile/avatar_item.dart';
import 'package:github/utils/fluro_covert.dart';

class RepositoryDetailPage extends StatefulWidget {
  final String author;
  final String name;

  const RepositoryDetailPage({
    Key key,
    this.author: '',
    this.name: '',
  }) : super(key: key);

  @override
  _RepositoryDetailPageState createState() => _RepositoryDetailPageState();
}

class _RepositoryDetailPageState extends State<RepositoryDetailPage> {
  Map<String, dynamic> data = {
    'stargazers_count': 0,
    'watchers_count': 0,
    'forks_count': 0,
    'default_branch': 'master',
    'language': '',
    'full_name': '',
    'description': '',
  };

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _asyncGetDetailData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _asyncGetDetailData() async {
    var resp = await Net.get(
        'https://api.github.com/repos/${widget.author}/${widget.name}');
    print('$resp');

    setState(() {
      data = resp;
      _isLoading = false;
    });
  }

  _handleListItemTap(BuildContext context, String path) {
    Application.router
        .navigateTo(context, path, transition: TransitionType.inFromRight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Repository'),
        ),
        body: SingleChildScrollView(
          // color: Colors.grey[200],
          child: _isLoading
              ? Spin()
              : ListBody(
                  children: <Widget>[
                    AvatarItem(
                      title: data['full_name'],
                      avatarUrl: data['owner']['avatar_url'],
                      description: data['description'],
                      hasArrow: false,
                    ),
                    StatisticsBlock(
                      items: [
                        {'title': 'Stars', 'count': data['stargazers_count']},
                        {'title': 'Watchs', 'count': data['watchers_count']},
                        {'title': 'Forks', 'count': data['forks_count']},
                      ],
                    ),
                    ListItem(
                      title: 'Pull Requests',
                      icon: Icons.call_split,
                      iconColor: Colors.blueGrey,
                      hasArrow: true,
                      onTap: () => _handleListItemTap(
                          context,
                          Routes.pullRequest +
                              '?author=${FluroCovert.stringEncode(data['owner']['login'])}&repo=${FluroCovert.stringEncode(data['name'])}'),
                    ),
                    ListItem(
                      title: 'Issues',
                      hasTopBorder: false,
                      icon: Icons.info,
                      iconColor: Colors.orange,
                      hasArrow: true,
                      onTap: () => _handleListItemTap(
                          context,
                          Routes.issue +
                              '?author=${FluroCovert.stringEncode(data['owner']['login'])}&repo=${FluroCovert.stringEncode(data['name'])}'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25.0),
                      child: ListItem(
                        title: data['language'],
                        icon: Icons.code,
                        iconColor: Colors.brown[800],
                      ),
                    ),
                    ListItem(
                      title: data['default_branch'],
                      hasTopBorder: false,
                      icon: Icons.device_hub,
                      iconColor: Colors.green[400],
                    ),
                    ListItem(
                      title: 'README',
                      hasTopBorder: false,
                      icon: Icons.book,
                      iconColor: Colors.blue[400],
                    ),
                    // WebviewPage(
                    //   url: 'http://baidu.com',
                    // )
                  ],
                ),
        ));
  }
}
