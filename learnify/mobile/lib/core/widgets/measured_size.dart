import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

typedef OnWidgetSizeChange = void Function(Size size);

class MeasuredSize extends StatefulWidget {
  const MeasuredSize({
    required this.onChange,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final OnWidgetSizeChange onChange;

  @override
  MeasuredSizeState createState() => MeasuredSizeState();
}

class MeasuredSizeState extends State<MeasuredSize> {
  GlobalKey<State<StatefulWidget>> widgetKey = GlobalKey();
  Size oldSize = Size.zero;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Container(key: widgetKey, child: widget.child);

  Future<void> postFrameCallback(_) async {
    final BuildContext? context = widgetKey.currentContext;
    if (context?.size == null) return;
    if (!mounted) return;
    final Size newSize = context!.size!;
    if (newSize == Size.zero) return;
    if (oldSize == newSize) return;
    oldSize = newSize;
    widget.onChange(newSize);
  }
}
