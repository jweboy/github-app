import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int activeIndex = 0;
  static const List<BottomNavigationBarItem> items = <BottomNavigationBarItem> [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('Center')
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      onTap: _onItemTapped,
      currentIndex: activeIndex,
    );
  }
}