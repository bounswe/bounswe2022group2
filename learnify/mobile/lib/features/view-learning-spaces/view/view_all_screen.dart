import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../home/model/learning_space_model.dart';
import '../../home/view-model/home_view_model.dart';
import 'view_all_list.dart';

class ViewAllScreen extends BaseView<HomeViewModel> {
  ViewAllScreen(
      {required List<LearningSpace> listOfLearningSpaces,
      required String learningSpacesType,
      Key? key})
      : super(
          builder: (BuildContext context) =>
              _builder(context, listOfLearningSpaces),
          appBar: (BuildContext context) =>
              _appBarBuilder(context, learningSpacesType),
          key: key,
        );

  static Widget _builder(
          BuildContext context, List<LearningSpace> listOfLearningSpaces) =>
      ViewAllList(
        listOfLearningSpaces: listOfLearningSpaces,
        buttonExist: false,
      );
  static DefaultAppBar _appBarBuilder(BuildContext context, String title) =>
      DefaultAppBar(
        size: context.height * 6,
        color: context.lightActiveColor,
        actionsList: <Widget>[
          Padding(
            padding: EdgeInsets.all(context.responsiveSize * .6),
          ),
          BaseIconButton(
            onPressed: () async => NavigationManager.instance
                .navigateToPageClear(path: NavigationConstants.home),
            icon: Icons.arrow_back_outlined,
            color: context.lightActiveColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: context.width * 4),
            child: BaseText(
              title,
              style: context.titleSmall,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 3,
            vertical: context.responsiveSize * 2.5),
      );
}
