import 'package:fluro/fluro.dart';
import 'package:github/routes/handlers.dart';

class Routes {
  static String home = '/';
  static String trending = '/trending';
  static String profile = '/profile';
  static String personInfo = '/personInfo';

  static void configureRoutes(Router router) {
    // 注册路由
    router.define(home, handler: homeHandler);
    router.define(trending, handler: trendingHandler);
    router.define(profile, handler: profileHandler);
    router.define(personInfo, handler: personInfoHandler);
  }
}
