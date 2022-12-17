import 'package:flutter/material.dart';

import '../../../../core/extensions/context/theme_extensions.dart';
import '../../extensions/context/context_extensions.dart';
import '../../extensions/string/string_extensions.dart';
import '../base-icon/base_icon.dart';
import '../text/multiline_text.dart';

/// Pop menu button.
class PopMenuButton extends StatefulWidget {
  /// Default constructor.
  const PopMenuButton({
    required this.values,
    required this.selectedValue,
    required this.onTap,
    this.translated = true,
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.icons = const <String>[],
    this.highlight = false,
    this.iconWidthFactor,
    this.titlePaddingFactor,
    this.offset,
    this.height,
    this.width,
    this.childPadding,
    this.padding,
    this.enabled = true,
    this.position = PopupMenuPosition.under,
    this.onCanceled,
    this.capitalize = false,
    this.optColor,
    this.alignment,
    this.decoration,
    this.capitalizeChoice = true,
    Key? key,
  }) : super(key: key);
  // --> Assert about the length of values and icons.

  /// All values.
  final List<String> values;

  /// Selected value.
  final String selectedValue;

  /// On tap callback.
  final ValueChanged<String> onTap;

  /// Whether the texts are flat.
  final bool translated;

  /// Enabled.
  final bool enabled;

  /// Whether to capitalize.
  final bool capitalize;

  /// Main alignment.
  final MainAxisAlignment mainAxisAlignment;

  /// Custom icon.
  final String? icon;

  /// All values.
  final List<String> icons;

  /// Whether to highlight on hover.
  final bool highlight;

  /// Icon width factor.
  final double? iconWidthFactor;

  /// Title padding factor.
  final double? titlePaddingFactor;

  /// Offset
  final Offset? offset;

  /// Height value.
  final double? height;

  /// width value.
  final double? width;

  /// Child padding.
  final EdgeInsets? childPadding;

  /// padding.
  final EdgeInsets? padding;

  /// Pop menu position
  final PopupMenuPosition position;

  /// On canceled callback.
  final VoidCallback? onCanceled;

  /// Optional custom color.
  final Color? optColor;

  /// Alignment.
  final Alignment? alignment;

  /// Box Deco.
  final BoxDecoration? decoration;

  /// capitalizeChoice
  final bool capitalizeChoice;

  @override
  State<PopMenuButton> createState() => _PopMenuButtonState();
}

class _PopMenuButtonState extends State<PopMenuButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final Color textColor = context.textColor;
    return Container(
      alignment: widget.alignment,
      decoration: widget.decoration,
      padding: widget.padding,
      width: widget.width,
      child: InkWell(
        onTap: () {},
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: PopupMenuButton<String>(
          onSelected: (String? val) {},
          onCanceled: widget.onCanceled,
          padding: EdgeInsets.symmetric(horizontal: context.width),
          elevation: 6,
          itemBuilder: (BuildContext context) => widget.values
              .map((String choice) => _popMenuItem(choice, context, textColor))
              .toList(),
          offset: widget.offset ?? Offset.zero,
          position: widget.position,
          enabled: widget.enabled,
          tooltip: widget.enabled ? null : '🚫',
          child: Padding(
            padding: widget.childPadding ??
                EdgeInsets.only(left: context.responsiveSize * .6),
            child: _popMenuChild(context, textColor),
          ),
        ),
        onHover: (bool val) {
          if (mounted) setState(() => _isHover = val);
        },
      ),
    );
  }

  Widget _popMenuChild(BuildContext context, Color? textColor) => Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.icon != null)
            Image.asset(widget.icon!, color: widget.optColor),
          if (widget.icon != null) context.sizedW(.5),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.responsiveSize *
                      (widget.titlePaddingFactor ?? .6)),
              child: _titleText(widget.selectedValue, context,
                  capitalize: widget.capitalize, textColor: widget.optColor),
            ),
          ),
          if (widget.enabled)
            BaseIcon(
              context,
              Icons.arrow_drop_down_outlined,
              size:
                  context.width * 4 * (widget.highlight && _isHover ? 1.2 : 1),
              padding: EdgeInsets.zero,
              color: widget.optColor,
            ),
        ],
      );

  PopupMenuItem<String> _popMenuItem(
          String choice, BuildContext context, Color? textColor) =>
      PopupMenuItem<String>(
        value: choice,
        height: widget.height ?? context.height * 4,
        onTap: () => widget.onTap(choice),
        child: Row(
          children: <Widget>[
            if (widget.icon != null)
              Image.asset(widget.icons[widget.values.indexOf(choice)]),
            Padding(
              padding: _padding(context),
              child: _titleText(
                widget.capitalizeChoice ? choice.toUpperCase() : choice,
                context,
                textColor: widget.selectedValue.compareWithoutCase(choice)
                    ? textColor
                    : null,
              ),
            ),
          ],
        ),
      );

  EdgeInsets _padding(BuildContext context) => widget.icon != null
      ? EdgeInsets.only(
          left: context.responsiveSize * (widget.titlePaddingFactor ?? .6))
      : EdgeInsets.zero;

  MultiLineText _titleText(
    String textKey,
    BuildContext context, {
    TextAlign? textAlign,
    Color? textColor,
    bool capitalize = false,
  }) =>
      MultiLineText(
        textKey,
        capitalize: capitalize,
        style: context.bodySmall,
        color: textColor,
        translated: widget.translated,
        textAlign: textAlign,
      );
}
