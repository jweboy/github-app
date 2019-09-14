import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:github/routes/routes.dart';
import 'package:github/utils/application.dart' show Application;
import 'package:github/views/home_page.dart';
import 'package:github/views/person_info/person_info_page.dart';
import 'package:github/views/profile/profile_page.dart';
import 'package:github/views/trending/trending_page.dart';
// import 'package:github/components/navigation_bar.dart';
// import 'package:github/views/home/home_page.dart';
// import 'package:github/views/detail_page.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// const String GITHUB_ACCESS_TOKEN = 'ba276d9c55ddbb05cac51cd908686f607e255859';

// TODO: show语法意义
// TODO: class语法

class MyApp extends StatefulWidget {
  MyApp() {
    // 创建路由实例
    final router = new Router();
    // 注册应用路由
    Routes.configureRoutes(router);
    // 挂载到全局
    Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'github-code',
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
      // home: new ProfilePage(),
      // onGenerateRoute: Application.router.generator,
    );
  }
}

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
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
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       //  debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         // home: new DetailPage(),
//         // home: new HomePage(),
//         home: new Trending(),
//         routes: <String, WidgetBuilder>{
//           DetailPage.routeName: (BuildContext context) => new DetailPage(),
//         },
//         // navigatorKey: new NavigationBar(),
//     );
//   }
// }
