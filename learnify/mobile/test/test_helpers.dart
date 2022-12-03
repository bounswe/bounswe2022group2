import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/constants/main_type_definitions.dart';
import 'package:learnify/core/providers/provider_list.dart';
import 'package:provider/provider.dart';

mixin TestHelpers {
  static Finder descendantFinder(Widget screen, Type type) =>
      find.descendant(of: find.byWidget(screen), matching: find.byType(type));

  static Finder descendantFinderByKey(Widget screen, Key key) =>
      find.descendant(of: find.byWidget(screen), matching: find.byKey(key));

  static Widget appWidget(Widget widget, {VoidInitCallback? childCallback}) =>
      MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          builder: (_, __) => MultiProvider(
            providers: ProviderList.providers,
            child: Builder(builder: (BuildContext context) {
              if (childCallback != null) childCallback(context);
              return widget;
            }),
          ),
        ),
      );
}
