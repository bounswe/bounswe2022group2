import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../features/learning-space/models/annotation_model.dart';
import '../../../../product/language/language_keys.dart';
import '../../../../product/theme/dark_theme.dart';
import '../../../extensions/context/context_extensions.dart';
import '../../../extensions/context/theme_extensions.dart';
import '../../divider/custom_vertical_divider.dart';
import '../base_text.dart';
import 'custom_annotatable_item.dart';

class CustomTextSelectionControls extends MaterialTextSelectionControls {
  CustomTextSelectionControls(
      {required this.annotations, this.items, this.textStyles});
  static const double _kToolbarContentDistanceBelow = 20;
  static const double _kToolbarContentDistance = 8;

  final List<CustomAnnotatableItem>? items;
  final List<TextStyle?>? textStyles;
  final List<Annotation> annotations;

  @override
  Widget buildToolbar(
      BuildContext context,
      Rect globalEditableRegion,
      double textLineHeight,
      Offset selectionMidpoint,
      List<TextSelectionPoint> endpoints,
      TextSelectionDelegate delegate,
      ClipboardStatusNotifier? clipboardStatus,
      Offset? lastSecondaryTapDownPosition) {
    final TextSelectionPoint startTextSelectionPoint = endpoints[0];
    final TextSelectionPoint endTextSelectionPoint =
        endpoints.length > 1 ? endpoints[1] : endpoints[0];
    final Offset anchorAbove = Offset(
        globalEditableRegion.left + selectionMidpoint.dx,
        globalEditableRegion.top +
            startTextSelectionPoint.point.dy -
            textLineHeight -
            _kToolbarContentDistance);
    final Offset anchorBelow = Offset(
      globalEditableRegion.left + selectionMidpoint.dx,
      globalEditableRegion.top +
          endTextSelectionPoint.point.dy +
          _kToolbarContentDistanceBelow,
    );
    final int startIndex = delegate.textEditingValue.selection.start;
    final int endIndex = delegate.textEditingValue.selection.end == 0
        ? 0
        : delegate.textEditingValue.selection.end - 1;

    final String selectionText = delegate.textEditingValue.text.substring(
        startIndex == -1 ? 0 : startIndex, endIndex <= 0 ? 0 : endIndex + 1);

    final List<CustomAnnotatableItem> finalItems =
        List<CustomAnnotatableItem>.from(
      items ??
          <CustomAnnotatableItem>[
            CustomAnnotatableItem(controlType: SelectionControlType.copy),
            // CustomAnnotatableItem(controlType: SelectionControlType.paste),
          ],
    );

    final Annotation? anyConflict = annotations.firstWhereOrNull(
        (Annotation a) =>
            (a.startIndex >= startIndex && endIndex >= a.startIndex) ||
            (a.startIndex <= startIndex && startIndex <= a.endIndex));
    if (anyConflict != null) {
      finalItems.removeWhere((CustomAnnotatableItem i) =>
          i.label == context.tr(TextKeys.annotate));
    }

    return MyTextSelectionToolbar(
      anchorAbove: anchorAbove,
      anchorBelow: anchorBelow,
      clipboardStatus: clipboardStatus,
      textStyles: textStyles,
      startIndex: startIndex,
      endIndex: endIndex,
      items: finalItems,
      selectionText: selectionText,
      handleCopy: () => handleCopy(delegate, clipboardStatus),
      handleCut: () => handleCut(delegate),
      handlePaste: () => handlePaste(delegate),
      handleSelectAll: () => handleSelectAll(delegate),
      callback: () => delegate
        ..userUpdateTextEditingValue(
            delegate.textEditingValue.copyWith(
                selection: TextSelection.collapsed(
                    offset: delegate.textEditingValue.selection.baseOffset)),
            SelectionChangedCause.doubleTap)
        ..hideToolbar(),
    );
  }
}

/// A toolbar containing the given [items].
class MyTextSelectionToolbar extends StatefulWidget {
  const MyTextSelectionToolbar({
    required this.anchorAbove,
    required this.anchorBelow,
    required this.items,
    required this.selectionText,
    required this.callback,
    required this.startIndex,
    required this.endIndex,
    this.textStyles,
    this.clipboardStatus,
    this.handleCopy,
    this.handleCut,
    this.handlePaste,
    this.handleSelectAll,
    Key? key,
  }) : super(key: key);

  final Offset anchorAbove;
  final Offset anchorBelow;
  final int startIndex;
  final int endIndex;
  final ClipboardStatusNotifier? clipboardStatus;
  final void Function()? handleCopy;
  final void Function()? handleCut;
  final void Function()? handlePaste;
  final void Function()? handleSelectAll;
  final List<CustomAnnotatableItem> items;
  final String selectionText;
  final void Function()? callback;
  final List<TextStyle?>? textStyles;

  @override
  MyTextSelectionToolbarState createState() => MyTextSelectionToolbarState();
}

class MyTextSelectionToolbarState extends State<MyTextSelectionToolbar> {
  void _onChangedClipboardStatus() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.clipboardStatus?.addListener(_onChangedClipboardStatus);
    widget.clipboardStatus?.update();
  }

  @override
  void didUpdateWidget(MyTextSelectionToolbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.clipboardStatus != oldWidget.clipboardStatus) {
      widget.clipboardStatus?.addListener(_onChangedClipboardStatus);
      oldWidget.clipboardStatus?.removeListener(_onChangedClipboardStatus);
    }
    widget.clipboardStatus?.update();
  }

  @override
  void dispose() {
    super.dispose();
    widget.clipboardStatus?.removeListener(_onChangedClipboardStatus);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context), 'ERROR');
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    final Map<SelectionControlType, void Function()?> selectorItem =
        <SelectionControlType, void Function()?>{
      SelectionControlType.copy: widget.handleCopy,
      SelectionControlType.cut: widget.handleCut,
      SelectionControlType.paste: widget.handlePaste,
      SelectionControlType.selectAll: widget.handleSelectAll,
      SelectionControlType.other: widget.callback,
    };

    final Map<SelectionControlType, String> selectorLabel =
        <SelectionControlType, String>{
      SelectionControlType.copy: localizations.copyButtonLabel,
      SelectionControlType.cut: localizations.cutButtonLabel,
      SelectionControlType.paste: localizations.pasteButtonLabel,
      SelectionControlType.selectAll: localizations.selectAllButtonLabel,
    };

    return TextSelectionToolbar(
      anchorAbove: widget.anchorAbove,
      anchorBelow: widget.anchorBelow,
      toolbarBuilder: (BuildContext context, Widget child) => Material(
        clipBehavior: Clip.antiAlias,
        elevation: 1,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: DarkAppTheme.darkBlue),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        type: MaterialType.card,
        child: child,
      ),
      children: <Widget>[
        for (int i = 0; i < widget.items.length; i++) ...<Widget>[
          TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size(context.width, context.height * 5),
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: padding(i).left / 1.2, right: padding(i).right / 1.2),
            ),
            onPressed: () {
              if (widget.items[i].onPressed != null) {
                widget.items[i].onPressed!(widget.selectionText);
              } else if (widget.items[i].onPressedAnnotation != null) {
                widget.items[i].onPressedAnnotation!(
                    widget.startIndex, widget.endIndex);
              }
              selectorItem[widget.items[i].controlType]!();
            },
            child: widget.items[i].icon != null
                ? widget.items[i].icon!
                : BaseText(
                    widget.items[i].label ??
                        selectorLabel[widget.items[i].controlType]!,
                    translated: false,
                    style: (widget.textStyles?.length ?? 0) > i
                        ? (widget.textStyles![i] ??
                            TextStyle(color: context.lightActiveColor))
                        : TextStyle(color: context.lightActiveColor),
                  ),
          ),
          SizedBox(
            height: context.height * 5,
            child: CustomVerticalDivider(
                color: context.lightActiveColor, thickness: .4, indent: 0),
          ),
        ]
      ],
    );
  }

  EdgeInsets padding(int i) =>
      TextSelectionToolbarTextButton.getPadding(i, widget.items.length);
}
