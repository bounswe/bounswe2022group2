import 'package:flutter/material.dart';

import '../../../product/theme/light_theme.dart';

class CustomVerticalDivider extends VerticalDivider {
  const CustomVerticalDivider(
      {Color? color,
      double? thickness,
      double? width,
      double? indent,
      Key? key})
      : super(
          key: key,
          color: color ?? LightAppTheme.lightBlue,
          thickness: thickness ?? 1,
          width: width ?? 1,
          indent: indent ?? 1,
          endIndent: indent ?? 1,
        );
}
