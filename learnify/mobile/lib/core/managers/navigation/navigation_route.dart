import 'package:flutter/material.dart';

import '../../../features/auth/forget-password/view/forget_password_screen.dart';
import '../../../features/auth/login/view/login_screen.dart';
import '../../../features/auth/signup/view/signup_screen.dart';
import '../../../features/auth/verification/view/verification_screen.dart';
import '../../../features/home-wrapper/view/home_wrapper_screen.dart';
import '../../../product/constants/navigation_constants.dart';

class NavigationRoute {
  factory NavigationRoute() => _instance;
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    final Map<String, dynamic> arguments = getArguments(args);
    switch (args.name) {
      case NavigationConstants.signup:
        return normalNavigate(const SignupScreen());
      case NavigationConstants.forgetpass:
        return normalNavigate(const ForgetPasswordScreen());
      case NavigationConstants.verify:
        return normalNavigate(VerificationScreen(email: arguments['email']));
      case NavigationConstants.login:
        return normalNavigate(const LoginScreen());
      case NavigationConstants.home:
        return normalNavigate(HomeWrapper());
      case NavigationConstants.search:
        return normalNavigate(HomeWrapper(initialIndex: 1));
      case NavigationConstants.courses:
        return normalNavigate(HomeWrapper(initialIndex: 2));
      case NavigationConstants.profile:
        return normalNavigate(HomeWrapper(initialIndex: 3));
      default:
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
