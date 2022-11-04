import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/app-bar/default_app_bar.dart';

/// FutureOr<void> function definition.
typedef AnyCallback = FutureOr<void> Function();

/// Future returns view model init state callback.
typedef FutureInitCallback = Future<void> Function(BuildContext context);
typedef VoidInitCallback = void Function(BuildContext context);

/// Builds default app bar by providing context.
typedef AppBarBuilder = DefaultAppBar Function(BuildContext context);

/// FutureOr<String?> function definition, displays error.
typedef ErrorHelper = FutureOr<String?> Function();

/// Callback of the checkbox.
typedef CheckboxCallback = void Function(bool value);

/// index callback
typedef IndexCallback = void Function(int index);

/// id callback
typedef IdCallback = void Function(String id);

typedef AnnotateCallback = Future<String?> Function(
    String annotatedText, String annotation);
