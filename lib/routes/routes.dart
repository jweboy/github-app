import 'package:fluro/fluro.dart';
import 'package:github/routes/handlers.dart';

class Routes {
  static String home = '/';
  static String trending = '/trending';
  static String profile = '/profile';
  static String personInfo = '/person-info';
  static String editPersonInfo = '/edit-person-info';
  static String settings = '/settings';
  static String about = '/about';
  static String webview = '/webview';
  static String repoDetail = '/repository-detail';
  static String pullRequest = '/pull-request';
  static String issue = '/issue';
  static String multipleConditionFilter = '/multiple-condition-filter';

  static void configureRoutes(Router router) {
    // 注册路由
    router.define(home, handler: homeHandler);
    router.define(trending, handler: trendingHandler);
    router.define(profile, handler: profileHandler);
    router.define(personInfo, handler: personInfoHandler);
    router.define(editPersonInfo, handler: editPersonInfoHandler);
    router.define(settings, handler: settingsHandler);
    router.define(about, handler: aboutHandler);
    router.define(webview, handler: webviewHandler);
    router.define(repoDetail, handler: repoDetailHandler);
    router.define(pullRequest, handler: pullRequestHandler);
    router.define(issue, handler: issueHandler);
    router.define(multipleConditionFilter,
        handler: multipleConditionFilterHandler);
  }
}
