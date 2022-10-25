import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/providers/theme/theme_provider.dart';
import '../../../core/widgets/base-icon/base_icon.dart';
import '../../../core/widgets/text/base_text.dart';
import '../constants/home_screen_constants.dart';
import '../view-model/home_view_model.dart';

part 'components/bottom_navigation_bar.dart';

class HomeScreen extends BaseView<HomeViewModel> {
  const HomeScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          bottomNavigationBar: const _BottomNavigationBar(),
          key: key,
        );

  static Widget _builder(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
      );
}
