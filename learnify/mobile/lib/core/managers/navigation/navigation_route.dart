import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../features/auth/forget-password/view/forget_password_screen.dart';
import '../../../features/auth/login/view/login_screen.dart';
import '../../../features/auth/signup/view/signup_screen.dart';
import '../../../features/auth/verification/view/verification_screen.dart';
import '../../../features/home-wrapper/view/home_wrapper_screen.dart';
import '../../../features/learning-space/view/add_post_screen.dart';
import '../../../features/learning-space/view/annotations_screen.dart';
import '../../../features/learning-space/view/components/chapter_image.dart';
import '../../../features/learning-space/view/create_event_screen.dart';
import '../../../features/learning-space/view/create_learning_space_screen.dart';
import '../../../features/learning-space/view/learning_space_detail_screen.dart';
import '../../../features/settings/view/settings_screen.dart';
import '../../../features/view-learning-spaces/view/view_all_screen.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../extensions/string/string_extensions.dart';

class NavigationRoute {
  factory NavigationRoute() => _instance;
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    final Map<String, dynamic> arguments = getArguments(args);
    switch (args.name) {
      case NavigationConstants.signup:
        return normalNavigate(const SignupScreen(), args);
      case NavigationConstants.forgetpass:
        return normalNavigate(const ForgetPasswordScreen(), args);
      case NavigationConstants.verify:
        return normalNavigate(
            VerificationScreen(email: arguments['email']), args);
      case NavigationConstants.login:
        return normalNavigate(const LoginScreen(), args);
      case NavigationConstants.home:
        return normalNavigate(HomeWrapper(), args);
      case NavigationConstants.viewall:
        return normalNavigate(
            ViewAllScreen(
                listOfLearningSpaces: arguments['listOfLearningSpaces'],
                learningSpacesType: arguments['learningSpacesType']),
            args);
      case NavigationConstants.search:
        return normalNavigate(HomeWrapper(initialIndex: 1), args);
      case NavigationConstants.courses:
        return normalNavigate(HomeWrapper(initialIndex: 2), args);
      case NavigationConstants.profile:
        return normalNavigate(HomeWrapper(initialIndex: 3), args);
      case NavigationConstants.settings:
        return normalNavigate(const SettingsScreen(), args);
      case NavigationConstants.learningSpace:
        return normalNavigate(
            LearningSpaceDetailScreen(
                learningSpace: arguments['learningSpace']),
            args);
      case NavigationConstants.annotations:
        return normalNavigate(
            AnnotationsScreen(
                annotations: arguments['annotations'],
                annotatedText: arguments['annotatedText']),
            args);
      case NavigationConstants.createEditLearningSpace:
        return normalNavigate(
            CreateLearningSpaceScreen(
                isCreate: arguments['isCreate'],
                learningSpace: arguments['learningSpace']),
            args);
      case NavigationConstants.postImage:
        return normalNavigate(
            PostImage(
              imageUrl: arguments['image'],
              allAnnotations: arguments['all_annotations'],
              postId: arguments['post_id'],
            ),
            args);
      case NavigationConstants.addEditPost:
        return normalNavigate(
            AddPostScreen(isAdd: arguments['isAdd'], post: arguments['post']),
            args);
      case NavigationConstants.createEvent:
        return normalNavigate(CreateEventScreen(), args);
      default:
        return normalNavigate(const SignupScreen(), args);
    }
  }

  PageTransition<Widget> normalNavigate(Widget widget, RouteSettings args,
      {PageTransitionType? animationType}) {
    final PageTransitionType defaultType =
        MyNavigatorObserver.isPrevious(args.name)
            ? PageTransitionType.leftToRight
            : PageTransitionType.rightToLeft;
    return PageTransition<Widget>(
      child: widget,
      type: animationType ?? defaultType,
      settings: args,
    );
  }

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

class MyNavigatorObserver extends NavigatorObserver {
  static List<Route<dynamic>> routeStack = <Route<dynamic>>[];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final int index = routeStack.indexOf(route);
    if (index != -1) routeStack.removeAt(index);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    routeStack.removeLast();
    if (newRoute != null) routeStack.add(newRoute);
  }

  static bool isPrevious(String? key) =>
      routeStack.length >= 2 &&
      (routeStack[routeStack.length - 1]
              .settings
              .name
              ?.compareWithoutCase(key) ??
          false);

  static bool hasVisited(String? key) =>
      routeStack.indexWhere((Route<dynamic> element) =>
          element.settings.name.compareWithoutCase(key)) !=
      -1;
}
