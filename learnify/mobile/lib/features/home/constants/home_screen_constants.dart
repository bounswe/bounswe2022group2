import 'package:flutter/material.dart';

import '../../../product/language/language_keys.dart';

mixin HomeScreenConstants {
  static const List<String> bottomNavBarTexts = <String>[
    TextKeys.home,
    TextKeys.search,
    TextKeys.courses,
    TextKeys.profile,
  ];
  static const List<IconData> icons = <IconData>[
    Icons.home_outlined,
    Icons.search_outlined,
    Icons.menu_book_outlined,
    Icons.person_outline,
  ];
}
