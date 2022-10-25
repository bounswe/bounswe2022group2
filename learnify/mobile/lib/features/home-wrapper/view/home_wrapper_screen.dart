import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/providers/theme/theme_provider.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/base-icon/base_icon.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/theme/light_theme.dart';
import '../../courses/view/courses_screen.dart';
import '../../home/view/home_screen.dart';
import '../../profile/view/profile_screen.dart';
import '../../search/view/search_screen.dart';
import '../constants/home_wrapper_constants.dart';
import '../view-model/home_wrapper_view_model.dart';

part 'components/bottom_navigation_bar.dart';

class HomeWrapper extends BaseView<HomeWrapperViewModel> {
  const HomeWrapper({Key? key})
      : super(
          builder: _builder,
          bottomNavigationBar: const _BottomNavigationBar(),
          appBar: _appBarBuilder,
          key: key,
        );

  static Widget _builder(_) => SelectorHelper<int, HomeWrapperViewModel>()
          .builder((_, HomeWrapperViewModel model) => model.bottomNavBarIndex,
              (BuildContext context, int index, __) {
        switch (index) {
          case 1:
            return const SearchScreen();
          case 2:
            return const CoursesScreen();
          case 3:
            return const ProfileScreen();
          default:
            return const HomeScreen();
        }
      });

  static DefaultAppBar _appBarBuilder(BuildContext context) => DefaultAppBar(
        size: context.height * 7,
        actionsList: <Widget>[
          Padding(
            padding: EdgeInsets.all(context.responsiveSize),
            child: Image.asset(IconKeys.logo),
          ),
          const Spacer(),
          BaseIconButton(
            onPressed: () {},
            icon: Icons.notifications_none_outlined,
            padding: EdgeInsets.all(context.responsiveSize * .9),
            color: context.lightActiveColor,
          ),
        ],
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 3,
            vertical: context.responsiveSize * 2.5),
      );
}
