import 'package:flutter/material.dart';
import 'package:github/views/profile/profile_page.dart';
import 'package:github/views/trending/trending_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  String appBarTitle = '';
  List<Widget> pages = [];

  List tabs = [
    {'text': 'Trending', 'icon': Icon(Icons.home)},
    {'text': 'Profile', 'icon': Icon(Icons.person)},
  ];

  List<BottomNavigationBarItem> _tabs = [];

  void _onItemTapped(int index) {
    setState(() {
      activeIndex = index;
      appBarTitle = tabs[index]['text'];
    });
  }

  @override
  void initState() {
    super.initState();

    pages..add((TrendingPage()))..add(ProfilePage());

    for (int i = 0; i < tabs.length; i++) {
      _tabs.add(BottomNavigationBarItem(
        icon: tabs[i]['icon'],
        title: Text(tabs[i]['text']),
      ));
    }

    appBarTitle = tabs[0]['text'];

    print('_tabs >>>> $tabs');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(appBarTitle),
      ),
      body: IndexedStack(
        index: activeIndex,
        children: pages,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _tabs,
        onTap: _onItemTapped,
        currentIndex: activeIndex,
      ),
    );
  }
}
