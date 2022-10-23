import 'package:flutter/material.dart';

import '../../constants/main_type_definitions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../text/base_text.dart';
import '../text/multiline_text.dart';
import 'custom_checkbox.dart';

/// Customized [Checkbox] with a leading text.
class CustomCheckboxTile extends StatefulWidget {
  /// Default constructor for [CheckboxListTile].
  const CustomCheckboxTile({
    required this.onTap,
    required this.text,
    this.initialValue = false,
    this.color,
    this.replaceValues = const <ReplaceValue>[],
    this.scale,
    this.width,
    this.sizedCheckbox = false,
    Key? key,
  }) : super(key: key);

  /// Initial value of the checkbox.
  final bool initialValue;

  /// Callback to call on checkbox click.
  final CheckboxCallback onTap;

  /// Text will be shown beside of the checkbox.
  final String text;

  /// Main color of the checkbox and text.
  final Color? color;

  /// Replace values for the text.
  final List<ReplaceValue> replaceValues;

  /// Scale factor.
  final double? scale;

  /// Width.
  final double? width;

  /// Whether the checkbox should be sized.
  final bool sizedCheckbox;

  @override
  State<CustomCheckboxTile> createState() => _CustomCheckboxTileState();
}

class _CustomCheckboxTileState extends State<CustomCheckboxTile> {
  /// Checkbox key
  GlobalKey<CustomCheckboxState> _checkboxKey =
      GlobalKey<CustomCheckboxState>();

  @override
  Widget build(BuildContext context) {
    _checkboxKey = GlobalKey<CustomCheckboxState>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (widget.sizedCheckbox)
          SizedCustomCheckbox(
              checkboxKey: _checkboxKey,
              onTap: widget.onTap,
              scale: widget.scale,
              initialValue: widget.initialValue,
              width: widget.width)
        else
          CustomCheckbox(
              checkboxKey: _checkboxKey,
              initialValue: widget.initialValue,
              onTap: widget.onTap,
              scale: widget.scale),
        Expanded(
          child: MultiLineText(
            widget.text,
            textAlign: TextAlign.left,
            style: context.bodySmall,
            replaceValues: widget.replaceValues,
            onClick: _onTextClick,
            color: widget.color,
          ),
        )
      ],
    );
  }

  void _onTextClick() => _checkboxKey.currentState?.switchValue();
}
