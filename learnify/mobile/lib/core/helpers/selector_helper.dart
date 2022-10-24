import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/view-model/base_view_model.dart';

/// Type of selector function.
typedef SelectorFunction<T, R> = T Function(BuildContext context, R model);

/// Type of selector builder
typedef SelectorBuilder<T> = Widget Function(
    BuildContext context, T val, Widget? child);

/// Callback type for select function.
typedef ListenCallback<T, R> = T Function(R model);

/// Type of function to determine whether to rebuild.
typedef ShouldRebuild<T> = bool Function(T pre, T next);

/// Helper for selectors
/// T: Item to return
/// R: View model to be used
class SelectorHelper<T, R extends BaseViewModel> {
  /// Returns the selector decides whether a field is changed.
  /// * T: Item to return
  /// * R: View model to be used
  Widget builder(
    SelectorFunction<T, R> selector,
    SelectorBuilder<T> selectorBuilder, {
    Widget? child,
    ShouldRebuild<T>? shouldRebuild,
  }) =>
      Selector<R, T>(
        builder: (BuildContext ctx, T val, Widget? child) =>
            selectorBuilder(ctx, val, child),
        shouldRebuild: shouldRebuild ?? (T pre, T next) => pre != next,
        selector: selector,
        child: child,
      );

  /// Listens a specific value.
  /// * T: Item to return
  /// * R: View model to be used
  T listenValue(ListenCallback<T, R> callback, BuildContext context) =>
      context.select<R, T>(callback);
}
