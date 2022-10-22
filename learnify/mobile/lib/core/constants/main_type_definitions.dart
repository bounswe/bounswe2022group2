import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/app-bar/default_app_bar.dart';

/// FutureOr<void> function definition.
typedef AnyCallback = FutureOr<void> Function();

/// Future or returns view model init state callback.
typedef ViewModelInitCallback = Future<void> Function(BuildContext context);

/// Builds default app bar by providing context.
typedef AppBarBuilder = DefaultAppBar Function(BuildContext context);

/// FutureOr<String?> function definition, displays error.
typedef ErrorHelper = FutureOr<String?> Function();
