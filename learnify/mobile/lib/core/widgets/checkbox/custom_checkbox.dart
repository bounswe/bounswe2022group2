import 'package:flutter/material.dart';

import '../../../product/theme/general_theme.dart';
import '../../constants/main_type_definitions.dart';
import '../../extensions/context/context_extensions.dart';
import '../../extensions/context/theme_extensions.dart';

/// Sized custom checkbox.
class SizedCustomCheckbox extends StatelessWidget {
  /// Default constructor.
  const SizedCustomCheckbox({
    this.initialValue = false,
    this.onTap,
    this.width,
    this.height,
    this.scale,
    this.checkboxKey,
    Key? key,
  }) : super(key: key);

  /// Custom initial value.
  final bool initialValue;

  /// On tap callback function.
  final CheckboxCallback? onTap;

  /// Width of the checkbox.
  final double? width;

  /// Height of the checkbox.
  final double? height;

  /// Custom scale factor for the size of the checkbox.
  final double? scale;

  /// Checkbox key.
  final GlobalKey<CustomCheckboxState>? checkboxKey;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height ?? context.height * 5,
        width: width ?? context.height * 4,
        child: CustomCheckbox(
          checkboxKey: checkboxKey,
          initialValue: initialValue,
          onTap: onTap,
          scale: scale,
          denseVisual: false,
        ),
      );
}

/// Customized checkbox.
class CustomCheckbox extends StatefulWidget {
  /// Default constructor.
  const CustomCheckbox({
    this.initialValue = false,
    this.onTap,
    this.scale,
    this.denseVisual = true,
    this.checkboxKey,
  }) : super(key: checkboxKey);

  /// Custom initial value.
  final bool initialValue;

  /// On tap callback function.
  final CheckboxCallback? onTap;

  /// Custom scale factor for the size of the checkbox.
  final double? scale;

  /// Whether to apply visual density.
  final bool denseVisual;

  /// Checkbox key.
  final GlobalKey<CustomCheckboxState>? checkboxKey;

  @override
  State<CustomCheckbox> createState() => CustomCheckboxState();
}

/// State of the custom checkbox.
class CustomCheckboxState extends State<CustomCheckbox> {
  late bool _value = widget.initialValue;
  static const double _visualDensity = -4;

  @override
  Widget build(BuildContext context) => Transform.scale(
        scale: widget.scale ?? context.responsiveSize * .24,
        child: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: _value,
          onChanged: _changeValue,
          visualDensity: widget.denseVisual
              ? const VisualDensity(
                  horizontal: _visualDensity, vertical: _visualDensity)
              : VisualDensity.standard,
          fillColor: GeneralTheme.all(context.primary),
          side: BorderSide(color: context.textColor, width: 1.5),
        ),
      );

  void _changeValue(bool? newValue) {
    if (newValue == null) return;
    if (widget.onTap != null) widget.onTap!(newValue);
    if (mounted) setState(() => _value = newValue);
  }

  /// Switches the current value.
  void switchValue() => _changeValue(!_value);
}
