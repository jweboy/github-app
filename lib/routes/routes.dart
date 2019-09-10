import 'package:fluro/fluro.dart';
import 'package:github/routes/handlers.dart';

class Routes {
  static String home = '/';
  static String trending = '/trending';

  static void configureRoutes(Router router) {
    // 注册路由
    router.define(home, handler: homeHandler);
    router.define(trending, handler: trendingHandler);
  }
}
