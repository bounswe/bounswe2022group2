import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions.dart';
import '../text/multiline_text.dart';

/// Builds various dialogs with different methods.
class DialogBuilder {
  /// Builds various dialogs with different methods.
  /// * e.g. [showLoadingDialog], [showResultDialog]
  const DialogBuilder(this.context);

  /// Context to show dialogs.
  final BuildContext context;

  /// Example loading dialog
  Future<void> showLoadingDialog() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: const AlertDialog(content: CircularProgressIndicator()),
        ),
      );

  /// Example text dialog
  Future<void> textDialog(String text, String title,
          {bool translate = false}) =>
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: SizedBox(
            height: context.height * 40,
            width: context.width * 60,
            child: Column(
              children: <Widget>[
                MultiLineText(title),
                MultiLineText(text, translated: translate),
              ],
            ),
          ),
        ),
      );
}
