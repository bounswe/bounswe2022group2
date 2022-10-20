import 'package:flutter/material.dart';

import 'l_navigation_manager.dart';

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
    String path = '/',
    Map<String, dynamic> data = const <String, dynamic>{},
  }) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({
    String path = '/',
    Map<String, dynamic> data = const <String, dynamic>{},
  }) async {
    await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }
}
