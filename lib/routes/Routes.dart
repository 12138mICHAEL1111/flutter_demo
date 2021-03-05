import '../pages/tabs/tabs.dart';
import 'package:flutter/material.dart';
import '../pages/user/login.dart';
import '../pages/user/STOPsignin.dart';

final routes = {
  '/': (context) => Tabs(),
  '/login': (context) => LoginPage(),
  '/stopregister':(context) => StopSignIn(),

};

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
