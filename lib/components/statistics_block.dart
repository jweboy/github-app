import 'dart:ffi';

import 'package:flutter/material.dart';

class StatisticsBlock extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const StatisticsBlock({
    Key key,
    this.items,
  }) : super(key: key);

  @override
  _StatisticsBlockState createState() => _StatisticsBlockState();
}

class _StatisticsBlockState extends State<StatisticsBlock> {
  final List<Widget> blocks = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.items.length; i++) {
      blocks.add(buildStatistics(
        title: widget.items[i]['title'],
        count: widget.items[i]['count'],
      ));
    }
  }

  static Widget buildStatistics({String title, int count}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            '$count',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Text(
            title,
            style: TextStyle(
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
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: blocks,
      ),
    );
  }
}
