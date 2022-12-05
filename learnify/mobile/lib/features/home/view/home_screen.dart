import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/managers/navigation/navigation_manager.dart';
import '../../../../product/constants/navigation_constants.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/language/language_keys.dart';
import '../../../product/theme/dark_theme.dart';
import '../../learning-space/models/learning_space_model.dart';
import '../../learning-space/view-model/learning_space_view_model.dart';
import '../view-model/home_view_model.dart';

part '../components/course_preview.dart';

class HomeScreen extends BaseView<HomeViewModel> {
  HomeScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          hasScaffold: false,
          futureInit: (BuildContext context) =>
              context.read<HomeViewModel>().fetchInitialLearningSpaces(),
          key: key,
        );

  static Widget _builder(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            left: context.width * 4,
            top: context.height * 3,
            bottom: context.height * 3,
            right: context.width * 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: context.height * 23,
              child: _coursePreviewList(context, TextKeys.takenLearnifies,
                  context.read<HomeViewModel>().takenLearningSpaces),
            ),
            context.sizedH(3),
            SizedBox(
              height: context.height * 23,
              child: _coursePreviewList(context, TextKeys.friendLearnifies,
                  context.read<HomeViewModel>().friendLearningSpaces),
            ),
            context.sizedH(3),
            SizedBox(
                height: context.height * 23,
                child: _coursePreviewList(
                    context,
                    TextKeys.recommendedLearnifies,
                    context.read<HomeViewModel>().recommendedLearningSpaces)),
          ],
        ),
      );

  static Widget _coursePreviewList(BuildContext context, String coursesType,
          List<LearningSpace> courseList) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            BaseText(coursesType,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            context.sizedH(.8),
            const Spacer(),
            _viewAllButton(coursesType),
          ]),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: courseList.length >= 8 ? 8 : courseList.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, _) =>
                  SizedBox(width: context.width * 3),
              itemBuilder: (BuildContext context, int index) => CoursePreview(
                learningSpace: courseList[index],
              ),
            ),
          )
        ],
      );

  static Widget _viewAllButton(String coursesType) =>
      SelectorHelper<bool, HomeViewModel>().builder(
          (_, HomeViewModel model) => model.getViewAllStatus(coursesType),
          (BuildContext context, bool takenViewAll, _) => BaseText(
                TextKeys.viewAll,
                fontWeight: FontWeight.w900,
                onClick:
                    context.read<HomeViewModel>().getViewAllStatus(coursesType)
                        ? () async =>
                            context.read<HomeViewModel>().viewAll(coursesType)
                        : null,
              ));
}
