import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../../extensions/string/string_extensions.dart';
import '../divider/custom_divider.dart';
import '../text/multiline_text.dart';

/// A choose dialog with single option.
class SingleChooseDialog<T> extends StatelessWidget {
  /// Default constructor of [SingleChooseDialog].
  const SingleChooseDialog({
    required this.title,
    required this.elements,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  /// Title of the dialog.
  final String title;

  /// All possible elements.
  final List<T> elements;

  /// Initial selected value.
  final T? initialValue;

  @override
  Widget build(BuildContext context) => SimpleDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))),
        title: Padding(
          padding: EdgeInsets.only(bottom: context.height * .5),
          child: MultiLineText(title,
              textAlign: TextAlign.center, style: context.titleSmall),
        ),
        children: _getDialogChildren(elements, context),
      );

  List<Column> _getDialogChildren(List<T> elements, BuildContext context) =>
      List<Column>.generate(
        elements.length,
        (int index) => Column(
          children: <Widget>[
            if (index == 0) const CustomDivider(),
            _getSimpleDialogOption(elements[index], context),
            const CustomDivider(),
          ],
        ),
      );

  Widget _getSimpleDialogOption(T element, BuildContext context) => Material(
        color: Colors.transparent,
        child: SimpleDialogOption(
          onPressed: () => Navigator.of(context).pop(element),
          child: _dialogChild(context, element),
        ),
      );

  Widget _dialogChild(BuildContext context, T element) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * .5),
          child: MultiLineText(_value(element),
              textAlign: TextAlign.center,
              translated: false,
              maxLines: 3,
              color: element == initialValue ? context.primary : null),
        ),
      );

  String _value(T el) {
    if (el is Enum) {
      return el.name.capitalize;
    } else if (el is String) {
      return el;
    } else {
      return el.toString();
    }
  }
}
