import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../features/learning-space/models/annotation/annotation_model.dart';
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

/// string callback
typedef StringCallback = void Function(String id);

/// annotation click callback
typedef AnnotationClickCallback = void Function(
    String id, String annotatedText);

typedef AnnotateTextDialogCallback
    = Future<Tuple2<Annotation?, String?>> Function(
        int startIndex, int endIndex, String annotation, String? chapterId);
typedef AnnotateImageDialogCallback
    = Future<Tuple2<Annotation?, String?>> Function(
        Offset startOffset,
        Offset endOffset,
        String annotation,
        String? chapterId,
        Color color,
        String imageUrl);
typedef AnnotateImageCallback = Future<Annotation?> Function(
    Offset start, Offset end, Color color);

typedef AnnotateCallback = Future<void> Function(int startIndex, int endIndex);
