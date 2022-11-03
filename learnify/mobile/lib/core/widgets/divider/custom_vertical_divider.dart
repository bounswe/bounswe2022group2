import 'package:flutter/material.dart';

import '../../../product/theme/light_theme.dart';

class CustomVerticalDivider extends VerticalDivider {
  const CustomVerticalDivider({Color? color, Key? key})
      : super(
          key: key,
          color: color ?? LightAppTheme.lightBlue,
          thickness: 1,
          width: 1,
          indent: 1,
          endIndent: 1,
        );
}
