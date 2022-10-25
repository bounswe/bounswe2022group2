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
import '../../home/view/home_screen.dart';
import '../constants/home_wrapper_constants.dart';
import '../view-model/home_wrapper_view_model.dart';

part 'components/bottom_navigation_bar.dart';

class HomeWrapper extends BaseView<HomeWrapperViewModel> {
  const HomeWrapper({Key? key})
      : super(
          builder: _builder,
          bottomNavigationBar: const _BottomNavigationBar(),
          key: key,
        );

  static Widget _builder(_) => SelectorHelper<int, HomeWrapperViewModel>()
          .builder((_, HomeWrapperViewModel model) => model.bottomNavBarIndex,
              (BuildContext context, int index, __) {
        switch (index) {
          case 0:
            return const HomeScreen();
          default:
            return const HomeScreen();
        }
      });
}
