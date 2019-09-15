import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:github/utils/fluro_covert.dart';
import 'package:github/views/about/about.dart';
import 'package:github/views/edit_person_info/edit_person_info.dart';
import 'package:github/views/person_info/person_info_page.dart';
import 'package:github/views/profile/profile_page.dart';
import 'package:github/views/home/home_page.dart';
import 'package:github/views/pull_request/pull_request_page.dart';
import 'package:github/views/repo_detail/repo_detail_page.dart';
import 'package:github/views/settings/settings_page.dart';
import 'package:github/views/trending/trending_page.dart';
import 'package:github/views/webview/webview_page.dart';

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

var editPersonInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String label = params['label']?.first;
  String value = params['value']?.first;

  return EditPersonInfoPage(
    label: FluroCovert.stringDeCode(label),
    value: FluroCovert.stringDeCode(value),
  );
});

var settingsHandler = new Handler(handlerFunc: (BuildContext context, params) {
  return SettingsPage();
});

var aboutHandler = new Handler(handlerFunc: (BuildContext context, params) {
  return AboutPage();
});

var webviewHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String url = params['url']?.first;

  return WebviewPage(url: FluroCovert.stringDeCode(url));
});

var repoDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String author = params['author']?.first;
  String name = params['name']?.first;

  return RepoDetailPage(
    author: FluroCovert.stringDeCode(author),
    name: FluroCovert.stringDeCode(name),
  );
});

var pullRequestHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String author = params['author']?.first;
  String repo = params['repo']?.first;

  return PullRequestPage(
      // author: FluroCovert.stringDeCode(author),
      // name: FluroCovert.stringDeCode(name),
      );
});
