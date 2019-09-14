import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:github/utils/fluro_covert.dart';
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
  String name = params['name']?.first;
  String description = params['description']?.first;
  String company = params['company']?.first;
  String location = params['location']?.first;
  String blog = params['blog']?.first;

  return PersonInfoPage(
    name: name,
    blog: FluroCovert.stringDeCode(blog),
    company: FluroCovert.stringDeCode(company),
    location: location,
    description: FluroCovert.stringDeCode(description),
  );
});
