import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:github/views/person_info/person_info_page.dart';
import 'package:github/views/profile/profile_page.dart';
import 'package:github/views/home/home_page.dart';
import 'package:github/views/trending/trending_page.dart';

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var trendingHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TrendingPage();
});

var profileHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ProfilePage();
});

var personInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  print('params >>> $params');
  return PersonInfoPage(
    name: params['name']?.first,
  );
});
