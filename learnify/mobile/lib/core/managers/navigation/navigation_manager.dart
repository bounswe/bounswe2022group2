import 'package:flutter/material.dart';

import '../../extensions/string/string_extensions.dart';
import 'l_navigation_manager.dart';
import 'navigation_route.dart';

class NavigationManager implements INavigationManager {
  factory NavigationManager() => _instance;
  NavigationManager._init();
  static final NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // ignore: prefer_function_declarations_over_variables
  final RoutePredicate removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({
    required String path,
    Map<String, dynamic> data = const <String, dynamic>{},
    bool checkHistory = false,
  }) async {
    final bool hasVisited = MyNavigatorObserver.hasVisited(path);
    if (!hasVisited || !checkHistory) {
      await navigatorKey.currentState?.pushNamed(path, arguments: data);
    } else {
      navigatorKey.currentState?.popUntil((Route<dynamic> route) =>
          route.settings.name?.compareWithoutCase(path) ?? false);
    }
  }

  @override
  Future<void> navigateToPageClear({
    String path = '/',
    Map<String, dynamic> data = const <String, dynamic>{},
  }) async {
    await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }

  @override
  void pop() => navigatorKey.currentState?.pop();
}
