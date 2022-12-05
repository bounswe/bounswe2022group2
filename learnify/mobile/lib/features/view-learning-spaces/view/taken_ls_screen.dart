import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../home/view-model/home_view_model.dart';
import '../../learning-space/models/learning_space_model.dart';
import 'view_all_list.dart';

class TakenLsScreen extends BaseView<HomeViewModel> {
  const TakenLsScreen({Key? key})
      : super(
          builder: _builder,
          key: key,
        );

  static Widget _builder(BuildContext context) {
    final List<LearningSpace> listOfLearningSpaces =
        SelectorHelper<List<LearningSpace>, HomeViewModel>().listenValue(
            (HomeViewModel model) => model.takenLearningSpaces, context);
    return ViewAllList(
      listOfLearningSpaces: listOfLearningSpaces,
      buttonExist: true,
    );
  }
}
