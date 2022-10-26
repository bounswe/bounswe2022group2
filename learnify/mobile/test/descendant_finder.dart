import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder descendantFinder(Widget screen, Type type) =>
    find.descendant(of: find.byWidget(screen), matching: find.byType(type));

Finder descendantFinderByKey(Widget screen, Key key) =>
    find.descendant(of: find.byWidget(screen), matching: find.byKey(key));
