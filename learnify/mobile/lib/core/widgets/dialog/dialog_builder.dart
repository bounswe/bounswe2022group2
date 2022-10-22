import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../indicators/custom_loading_indicator.dart';
import '../text/multiline_text.dart';

/// Builds various dialogs with different methods.
class DialogBuilder {
  /// Builds various dialogs with different methods.
  /// * e.g. [showLoadingDialog], [textDialog]
  const DialogBuilder(this.context);

  /// Context to show dialogs.
  final BuildContext context;

  /// Example loading dialog
  Future<void> showLoadingDialog() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(content: CustomLoadingIndicator(context)),
        ),
      );

  /// Example text dialog
  Future<void> textDialog(String text, String title,
          {bool translate = false}) =>
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: MultiLineText(title,
              style: context.displaySmall, textAlign: TextAlign.center),
          content: ConstrainedBox(
            constraints: BoxConstraints.loose(
                Size(context.width * 60, context.height * 70)),
            child: MultiLineText(text,
                translated: translate, textAlign: TextAlign.center),
          ),
        ),
      );
}
