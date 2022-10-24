import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../../managers/navigation/navigation_manager.dart';
import '../base-icon/base_icon.dart';
import '../buttons/base_icon_button.dart';
import '../text/base_text.dart';

/// Default App Bar extends [AppBar]
/// with its required functions.
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Default app bar constructor.
  const DefaultAppBar({
    this.size,
    this.color,
    this.actionsList = const <Widget>[],
    this.titleIcon,
    this.titleText,
    this.showBack,
    this.textStyle,
    this.icon,
    this.absorb = false,
    this.padding,
    Key? key,
  }) : super(key: key);

  /// Size of the app bar.
  final double? size;

  /// Background color of the app bar.
  final Color? color;

  /// List of actions on the app bar.
  final List<Widget> actionsList;

  /// Icon of the title.
  final IconData? titleIcon;

  /// Text of the title.
  final String? titleText;

  /// Indicates whether to show a return back icon at top left.
  final bool? showBack;

  /// Style of the title text.
  final TextStyle? textStyle;

  /// Custom icon widget.
  final WidgetBuilder? icon;

  /// Determines whether to absorb the pointer.
  final bool absorb;

  /// Custom padding value.
  final EdgeInsets? padding;

  Widget _titleTextWidget(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.responsiveSize * 5),
          child: BaseText(titleText!, style: textStyle),
        ),
      );

  Widget _backButton(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: BaseIconButton(
          onPressed: NavigationManager.instance.pop,
          icon: Icons.chevron_left_outlined,
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(size ?? 100);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: absorb
            ? IgnorePointer(
                ignoring: absorb,
                child: _safeAreaChild(context, absorb),
              )
            : _safeAreaChild(context, absorb),
      );

  Widget _safeAreaChild(BuildContext context, bool absorb) => Container(
        color: Colors.black,
        alignment: Alignment.center,
        padding: padding ??
            EdgeInsets.symmetric(
                vertical: context.responsiveSize * 3,
                horizontal: context.responsiveSize * 8),
        child: absorb
            ? ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: _appBarRow(context),
              )
            : _appBarRow(context),
      );

  Widget _appBarRow(BuildContext context) => Row(
        children: <Widget>[
          if (showBack ?? !kIsWeb) _backButton(context),
          if (icon != null)
            icon!(context)
          else if (titleIcon != null)
            BaseIcon(context, titleIcon!, color: context.textColor),
          context.sizedW(2),
          if (titleText != null) Expanded(child: _titleTextWidget(context)),
          ...actionsList,
        ],
      );

  /// Copies the given [DefaultAppBar] with the one we have.
  DefaultAppBar copyWithSize(double newSize) => DefaultAppBar(
        color: color,
        actionsList: actionsList,
        size: newSize,
        titleIcon: titleIcon,
        titleText: titleText,
        showBack: showBack,
        textStyle: textStyle,
        icon: icon,
        absorb: absorb,
        padding: padding,
      );
}
