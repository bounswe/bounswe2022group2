import 'package:flutter/material.dart';

class NavigationRoute {
  factory NavigationRoute() => _instance;
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    final Map<String, dynamic> arguments = getArguments(args);
    switch (args.name) {
      // TODO: Fix
      // case NavigationConstants.login:
      //   return normalNavigate(const LoginScreen());
      // case NavigationConstants.home:
      //   return normalNavigate(const HomeScreen());
      default:
        // TODO: Fix
        return normalNavigate(Container());
      // return normalNavigate(const LoginScreen());
    }
  }

  MaterialPageRoute<Widget> normalNavigate(Widget widget) =>
      MaterialPageRoute<Widget>(builder: (BuildContext context) => widget);

  Map<String, dynamic> getArguments(RouteSettings args) {
    Map<String, dynamic> arguments;
    try {
      arguments =
          args.arguments as Map<String, dynamic>? ?? <String, dynamic>{};
    } on Exception {
      arguments = <String, dynamic>{};
    }
    return arguments;
  }
}
