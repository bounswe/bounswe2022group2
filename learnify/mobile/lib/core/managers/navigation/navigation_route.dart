import 'package:flutter/material.dart';

import '../../../features/home-wrapper/view/home_wrapper_screen.dart';
import '../../../product/constants/navigation_constants.dart';
import 'navigation_manager.dart';

class NavigationRoute {
  factory NavigationRoute() => _instance;
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    final Map<String, dynamic> arguments = getArguments(args);
    switch (args.name) {
      case NavigationConstants.signup:
        // TODO: Fix
        return normalNavigate(HomeWrapper());
      case NavigationConstants.login:
        return normalNavigate(
            const Scaffold(body: Center(child: Text('LOGIN'))));
      case NavigationConstants.home:
        return normalNavigate(Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () => NavigationManager.instance.navigateToPageClear(),
              child: const Text('HOME'),
            ),
          ),
        ));
      default:
        // TODO: Fix
        return normalNavigate(HomeWrapper());
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
