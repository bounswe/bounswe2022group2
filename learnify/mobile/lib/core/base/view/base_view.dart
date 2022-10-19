import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/main_type_definitions.dart';
import '../../extensions/context/context_extensions.dart';
import '../../widgets/app-bar/default_app_bar.dart';
import '../../widgets/buttons/custom_gesture_detector.dart';
import '../../widgets/scroll/base_single_child_scroll_view.dart';
import '../view-model/base_view_model.dart';

/// Base view class to create customized view models using this.
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  /// Default constructor for [BaseView].
  const BaseView({
    required this.mobileBuilder,
    this.customDispose,
    this.customInitState,
    this.appBar,
    this.resizeToAvoidBottomInset = true,
    this.safeArea = true,
    this.scrollable = false,
    this.drawer,
    this.hasScaffold = true,
    this.centered = true,
    Key? key,
  }) : super(key: key);

  /// Function to build the body for mobile.
  final WidgetBuilder mobileBuilder;

  /// Custom dispose method to call on dispose.
  final VoidCallback? customDispose;

  /// Custom init state method to call on init state.
  final ViewModelInitCallback? customInitState;

  /// Custom app bar.
  final AppBarBuilder? appBar;

  /// Determines whether to resize to avoid bottom inset in [Scaffold].
  final bool resizeToAvoidBottomInset;

  /// Determines whether to wrap with [SafeArea].
  final bool safeArea;

  /// Determines whether the screen is scrollable.
  final bool scrollable;

  /// Custom drawer.
  final Widget? drawer;

  /// Whether the widget should be wrapped with Scaffold.
  final bool hasScaffold;

  /// Determines whether the widget is centered.
  final bool centered;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T model = context.read<T>();

  @override
  void initState() {
    model.initView();
    super.initState();
  }

  @override
  void dispose() {
    model.disposeView();
    if (widget.customDispose != null) widget.customDispose!();
    model.customDispose();
    super.dispose();
  }

  @override
  void deactivate() {
    model.deactivateView();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    model = context.read<T>();
    final Widget centeredWidget =
        widget.centered ? Center(child: _child) : _child;
    final Widget body =
        widget.safeArea ? SafeArea(child: centeredWidget) : centeredWidget;
    return CustomGestureDetector(
        child: widget.hasScaffold
            ? Scaffold(
                resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
                appBar: _appBar,
                drawer: widget.drawer,
                body: body,
              )
            : body);
  }

  DefaultAppBar? get _appBar =>
      widget.appBar?.call(context).copyWithSize(context.responsiveSize * 14);

  Widget get _child => widget.scrollable
      ? LayoutBuilder(
          builder: (_, BoxConstraints constraints) =>
              _scrollableWidget(constraints),
        )
      : _selectable;

  Widget _scrollableWidget(BoxConstraints constraints) =>
      BaseSingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: _selectable,
        ),
      );

  Widget get _selectable => Container();
}
