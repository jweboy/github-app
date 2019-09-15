import 'package:flutter/material.dart';
import 'package:github/components/spin.dart';
import 'package:github/components/tab_bar.dart';
import 'package:github/utils/net.dart';

class IssuePage extends StatefulWidget {
  @override
  _IssuePageState createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
  final List<String> tabOptions = ['open', 'closed'];
  bool _isLoading = false;

  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();

    _asyncGetPullRequestData();
  }

  Future<void> _asyncGetPullRequestData(
      {String state = 'open', int pageIndex}) async {
    var resp = await Net.get('/repos/jweboy/github-app/pulls?state=$state');

    print('resp >>> $resp');

    setState(() {
      items = resp;
      _isLoading = false;
    });
  }

  void _handleTabTap(int index) {
    setState(() {
      _isLoading = true;
      _asyncGetPullRequestData(state: tabOptions[index]);
    });
  }

  // Widget renderListItem(index, item) {
  //   return new RepositoryItem(
  //     item: item,
  //     // handleTapEvent: navigateToDetailPage,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Issues'),
        ),
        body: Container(
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: AppTabBar(
                  options: tabOptions,
                  onTap: _handleTabTap,
                ),
              ),
              Container(
                child: _isLoading ? Spin() : Text('s'),
              )
              // Container(
              //   child: ListView.separated(
              //     separatorBuilder: (BuildContext context, int index) =>
              //         Divider(),
              //     itemCount: items.length,
              //     itemBuilder: (context, index) {
              //       return new RepositoryItem(
              //         item: items[index],
              //         // onTap: () => _handleItemTap(context, items[index]),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ) // tabs: tabs.map((e) => Tab(text: e)).toList()),
        );
  }
}
