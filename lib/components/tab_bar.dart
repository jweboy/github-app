import 'package:flutter/material.dart';

class AppTabBar extends StatefulWidget {
  final List<String> options;
  final Function onTap;

  const AppTabBar({Key key, this.options, this.onTap}) : super(key: key);

  @override
  _AppTabBarState createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> with TickerProviderStateMixin {
  TabController _tabController;
  // final List<String> options = ['open', 'closed'];
  List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();

    tabs = widget.options.map((String tab) {
      return Tab(text: tab);
    }).toList();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: _tabController,
        tabs: tabs,
        labelColor: Colors.blue,
        onTap: widget.onTap,
        // labelColor: Colors.red,
      ),
    );
  }
}
