import 'package:flutter/material.dart';
import 'package:github/views/home/home_page.dart';
import 'package:github/views/detail_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());

const String GITHUB_ACCESS_TOKEN = 'ba276d9c55ddbb05cac51cd908686f607e255859';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   // request link
  //   final HttpLink httpLink = HttpLink(
  //     uri: 'https://api.github.com/graphql',
  //   );

  //   // auth link
  //   final AuthLink authLink = AuthLink(
  //     getToken: () async => 'Bearer $GITHUB_ACCESS_TOKEN'
  //   );

  //   // http link
  //   Link link = authLink.concat(httpLink as Link);

  //   // graphql client
  //   final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
  //     GraphQLClient(
  //       cache: OptimisticCache(
  //         dataIdFromObject: typenameDataIdFromObject,
  //       ),
  //       link: link,
  //     )
  //   );

    // graphql provider
    // return GraphQLProvider(
    //   client: client,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     // title: 'Flutter Demddo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: const CacheProvider(
    //       child: HomePage(),
    //     ),
    //     routes: <String, WidgetBuilder>{
    //       SettingsScreen.routeName: (BuildContext context) => new SettingsScreen(),
    //     },
    //   ),
    // );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //  debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new DetailPage(),
        routes: <String, WidgetBuilder>{
          DetailPage.routeName: (BuildContext context) => new DetailPage(),
        },
    );
  }
}