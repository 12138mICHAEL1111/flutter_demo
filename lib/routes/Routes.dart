import '../pages/tabs/tabs.dart';
import 'package:flutter/material.dart';
import '../pages/user/login.dart';
import '../pages/user/STOPsignin.dart';
import '../pages/user/resetpassword.dart';
final routes = {
  '/': (context) => Tabs(),
  '/login': (context) => LoginPage(),
  '/stopregister':(context) => StopSignIn(),
  '/resetpassword':(context) => ResetPassword()
};

// 路由传值的固定代码
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
