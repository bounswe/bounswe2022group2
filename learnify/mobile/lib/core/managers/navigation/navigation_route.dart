import 'package:flutter/material.dart';

import '../../../features/auth/signup/view/signup_screen.dart';
import '../../../features/home-wrapper/view/home_wrapper_screen.dart';
import '../../../features/profile/view/profile_screen.dart';
import '../../../product/constants/navigation_constants.dart';

class NavigationRoute {
  factory NavigationRoute() => _instance;
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    final Map<String, dynamic> arguments = getArguments(args);
    switch (args.name) {
      // TODO: Fix
      case NavigationConstants.signup:
        return normalNavigate(const HomeWrapper());
        return normalNavigate(const SignupScreen());
      case NavigationConstants.login:
        return normalNavigate(
            const Scaffold(body: Center(child: Text('LOGIN'))));
      case NavigationConstants.home:
        return normalNavigate(const HomeWrapper());
      case NavigationConstants.profile:
        return normalNavigate(const ProfileScreen());
      default:
        return normalNavigate(const HomeWrapper());
        return normalNavigate(const SignupScreen());
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
