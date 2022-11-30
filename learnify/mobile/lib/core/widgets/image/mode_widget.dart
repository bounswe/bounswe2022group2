import 'package:flutter/material.dart';

import 'image_painter.dart';

class SelectionItems extends StatelessWidget {
  const SelectionItems({Key? key, this.isSelected, this.data, this.onTap})
      : super(key: key);
  final bool? isSelected;
  final ModeData? data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isSelected! ? Colors.blue : Colors.transparent),
        child: ListTile(
          leading: IconTheme(
            data: const IconThemeData(opacity: 1),
            child: Icon(data!.icon,
                color: isSelected! ? Colors.white : Colors.black),
          ),
          title: Text(
            data!.label!,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: isSelected!
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyText1!.color),
          ),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          selected: isSelected!,
        ),
      );
}

List<ModeData> paintModes() => [
      const ModeData(
          icon: Icons.crop_free, mode: PaintMode.rect, label: 'Annotate'),
    ];

@immutable
class ModeData {
  const ModeData({
    this.icon,
    this.mode,
    this.label,
  });
  final IconData? icon;
  final PaintMode? mode;
  final String? label;
}
