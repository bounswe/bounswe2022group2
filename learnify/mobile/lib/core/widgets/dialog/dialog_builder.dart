import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../features/learning-space/models/annotation/annotation_model.dart';
import '../../../product/language/language_keys.dart';
import '../../../product/theme/general_theme.dart';
import '../../constants/main_type_definitions.dart';
import '../../extensions/context/context_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../buttons/action_button.dart';
import '../indicators/custom_loading_indicator.dart';
import '../text-field/custom_text_form_field.dart';
import '../text/base_text.dart';
import '../text/multiline_text.dart';
import 'single_choose_dialog.dart';

/// Builds various dialogs with different methods.
class DialogBuilder {
  /// Builds various dialogs with different methods.
  /// * e.g. [showLoadingDialog], [textDialog]
  const DialogBuilder(this.context);

  /// Context to show dialogs.
  final BuildContext context;

  /// Example loading dialog
  Future<void> showLoadingDialog() async => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(content: CustomLoadingIndicator(context)),
        ),
      );

  /// Example text dialog
  Future<void> textDialog(
    String text,
    String title, {
    bool translate = false,
    bool translateTitle = true,
  }) async =>
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: MultiLineText(title,
              style: context.displaySmall,
              textAlign: TextAlign.center,
              translated: translateTitle),
          content: ConstrainedBox(
            constraints: BoxConstraints.loose(
                Size(context.width * 60, context.height * 70)),
            child: MultiLineText(text,
                translated: translate, textAlign: TextAlign.center),
          ),
        ),
      );

  /// Annotate dialog
  Future<Annotation?> annotateDialog(
    String? postId, {
    AnnotateTextDialogCallback? textCallback,
    AnnotateImageDialogCallback? imageCallback,
    int? startIndex,
    int? endIndex,
    Offset? startOffset,
    Offset? endOffset,
    Color? color,
    String? imageUrl,
  }) async {
    String annotationText = '';
    final Annotation? res = await showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => AlertDialog(
          title: BaseText(TextKeys.annotateText, style: context.titleLarge),
          titlePadding: EdgeInsets.only(top: context.height * 3),
          contentPadding: EdgeInsets.symmetric(
              horizontal: context.width * 6, vertical: context.height * 2),
          content: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                CustomTextFormField(
                  hintText: TextKeys.annotationHintText,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.width * 4,
                      vertical: context.height * 2),
                  textInputType: TextInputType.multiline,
                  constraints: const BoxConstraints(),
                  maxLength: 400,
                  onChanged: (String val) =>
                      setState(() => annotationText = val),
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.end,
          actionsPadding: _actionsPadding(context),
          actions: <Widget>[
            _dialogActionButton(
              TextKeys.cancel,
              callback: () => Navigator.of(context).pop(null),
            ),
            _dialogActionButton(
              TextKeys.annotate,
              asyncCallback: () async {
                final NavigatorState navigator = Navigator.of(context);
                if (textCallback != null) {
                  final Tuple2<Annotation?, String?> res = await textCallback(
                      startIndex ?? 0, endIndex ?? 0, annotationText, postId);
                  navigator.pop(res.item1);
                  return res.item2;
                } else if (imageCallback != null && imageUrl != null) {
                  final Tuple2<Annotation?, String?> res = await imageCallback(
                    startOffset ?? Offset.zero,
                    endOffset ?? Offset.zero,
                    annotationText,
                    postId,
                    color ?? Colors.white,
                    imageUrl,
                  );
                  navigator.pop(res.item1);
                  return res.item2;
                }
                navigator.pop(null);
                return null;
              },
              isAction: true,
              isActive: annotationText.length > 3,
            ),
          ],
        ),
      ),
    );
    return res;
  }

  Widget _dialogActionButton(
    String text, {
    ErrorHelper? asyncCallback,
    VoidCallback? callback,
    bool isAction = false,
    bool isActive = true,
  }) =>
      isAction
          ? ActionButton(
              onPressedError: () async {
                final String? res =
                    asyncCallback == null ? null : await asyncCallback();
                return res;
              },
              isActive: isActive,
              onPressed: callback,
              text: text,
              textStyle:
                  context.labelLarge.copyWith(color: context.lightActiveColor),
              padding: EdgeInsets.symmetric(
                  horizontal: context.width * 2.5,
                  vertical: context.height * .3),
              sizeFactor: const Size(15, 4),
            )
          : TextButton(
              onPressed: callback,
              style: ButtonStyle(
                padding: GeneralTheme.all(
                  EdgeInsets.symmetric(
                      horizontal: context.width * .5,
                      vertical: context.height * .3),
                ),
                fixedSize: GeneralTheme.all(Size(
                    context.responsiveSize * 12, context.responsiveSize * 4)),
              ),
              child: BaseText(text, style: context.labelLarge),
            );

  EdgeInsets _actionsPadding(BuildContext context) => EdgeInsets.only(
      top: context.height * .1,
      left: context.width * 4,
      right: context.width * 4,
      bottom: context.height * 1);

  /// Shows a dialog with single selection option.
  Future<T?> singleSelectDialog<T>(
          String title, List<T> elements, T? initialValue) async =>
      showDialog<T?>(
        context: context,
        builder: (BuildContext context) => SingleChooseDialog<T>(
            title: title, elements: elements, initialValue: initialValue),
      );
}
