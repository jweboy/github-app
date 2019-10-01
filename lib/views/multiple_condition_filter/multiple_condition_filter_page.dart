import 'package:flutter/material.dart';
import 'package:github/components/tab_bar.dart';
import 'package:github/utils/application.dart';
import 'package:github/utils/router.dart';

class MultipleConditionFilter extends StatefulWidget {
  @override
  _MultipleConditionFilterState createState() =>
      _MultipleConditionFilterState();
}

class _MultipleConditionFilterState extends State<MultipleConditionFilter> {
  final List<String> tabOpts = ['今日', '本周', '本月'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Router.pop(context);
              },
            );
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            AppTabBar(
              options: tabOpts,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade400,
                    filled: true,
                    contentPadding: const EdgeInsets.all(5.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    labelText: '请输入',
                    prefixIcon: Icon(Icons.search)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
