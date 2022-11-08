import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/language/language_keys.dart';
import '../../../product/theme/dark_theme.dart';
import '../model/course_model.dart';
import '../view-model/home_view_model.dart';

part '../components/course_preview.dart';

class HomeScreen extends BaseView<HomeViewModel> {
  HomeScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          hasScaffold: false,
          futureInit: (BuildContext context) =>
              context.read<HomeViewModel>().fetchInitialCourses(),
          key: key,
        );

  static Widget _builder(BuildContext context) => Padding(
        padding: EdgeInsets.all(context.width * 5),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 185,
              child: _coursePreviewList(context, 'Taken Courses',
                  context.read<HomeViewModel>().takenCourses),
            ),
            context.sizedH(3),
            SizedBox(
              height: 185,
              child: _coursePreviewList(context, "Friends Courses",
                  context.read<HomeViewModel>().friendCourses),
            ),
            context.sizedH(3),
            SizedBox(
                height: 185,
                child: _coursePreviewList(context, 'Recommended Courses',
                    context.read<HomeViewModel>().recommendedCourses)),
          ],
        ),
      );

  static Widget _coursePreviewList(
          BuildContext context, String coursesType, List<Course> courseList) =>
      Column(
        children: <Widget>[
          Text(coursesType,
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          context.sizedH(2),
          _viewAllButton(coursesType),
          context.sizedH(2),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: courseList.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, _) =>
                  SizedBox(width: context.width * 5),
              itemBuilder: (BuildContext context, int index) => _CoursePreview(
                  textKey: courseList[index].name ?? '',
                  participantNumber: courseList[index].numParticipants ?? 0),
            ),
          )
        ],
      );

  static Widget _viewAllButton(String coursesType) =>
      SelectorHelper<bool, HomeViewModel>().builder(
          (_, HomeViewModel model) => model.getViewAllStatus(coursesType),
          (BuildContext context, bool takenViewAll, _) => BaseText(
                TextKeys.viewAll,
                onClick:
                    context.read<HomeViewModel>().getViewAllStatus(coursesType)
                        ? () async =>
                            context.read<HomeViewModel>().viewAll(coursesType)
                        : null,
              ));
}
