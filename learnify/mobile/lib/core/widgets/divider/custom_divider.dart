import 'package:flutter/material.dart';

import '../../../product/theme/light_theme.dart';

class CustomDivider extends Divider {
  const CustomDivider({Color? color, Key? key})
      : super(
          key: key,
          color: color ?? LightAppTheme.lightBlue,
          thickness: 1,
          height: 1,
          indent: 1,
          endIndent: 1,
        );
}
