import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:github/utils/application.dart';

class Router {
  static void navigate(BuildContext context,
      {String path,
      String query,
      TransitionType transition = TransitionType.inFromRight}) {
    Application.router.navigateTo(context, path, transition: transition);
  }
}
