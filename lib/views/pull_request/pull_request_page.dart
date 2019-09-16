import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:github/components/empty_data.dart';
// import 'package:github/components/pull_refresh.dart' as refreshComponent;
import 'package:github/components/spin.dart';
import 'package:github/components/tab_bar.dart';
import 'package:github/routes/routes.dart';
import 'package:github/utils/application.dart';
import 'package:github/utils/net.dart';
import 'package:github/views/pull_request/pull_item.dart';
import 'package:github/utils/fluro_covert.dart';

class PullRequestPage extends StatefulWidget {
  final String author;
  final String repo;

  const PullRequestPage({Key key, this.author, this.repo}) : super(key: key);

  @override
  _PullRequestPageState createState() => _PullRequestPageState();
}

class _PullRequestPageState extends State<PullRequestPage> {
  final List<String> tabOptions = ['open', 'closed'];
  bool _isLoading = false;

  List items = new List();

  @override
  void initState() {
    super.initState();

    setState(() {
      _isLoading = true;
      _asyncGetPullRequestData();
    });
  }

  Future<void> _asyncGetPullRequestData(
      {String state = 'open', int pageIndex}) async {
    var resp = await Net.get(
        'https://api.github.com/repos/${widget.author}/${widget.repo}/pulls',
        queryParameters: {'state': state});

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

  void _handleItemTap(BuildContext context, Map<String, dynamic> data) {
    Application.router.navigateTo(context,
        Routes.webview + '?url=${FluroCovert.stringEncode(data['html_url'])}',
        transition: TransitionType.inFromRight);
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
          title: Text('Pull Request'),
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
                child: _isLoading
                    ? Spin()
                    : (items.length > 0
                        ? Flexible(
                            child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return PullItem(
                                data: items[index],
                                onTap: () =>
                                    _handleItemTap(context, items[index]),
                              );
                            },
                          ))
                        : EmptyData()),
              )
            ],
          ),
        ));
  }
}
