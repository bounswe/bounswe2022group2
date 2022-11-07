import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
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
              height: context.height * 23,
              child: _coursePreviewList(context, TextKeys.takenCourses,
                  context.read<HomeViewModel>().takenCourses),
            ),
            context.sizedH(3),
            SizedBox(
              height: context.height * 23,
              child: _coursePreviewList(context, TextKeys.friendCourses,
                  context.read<HomeViewModel>().friendCourses),
            ),
            context.sizedH(3),
            SizedBox(
                height: context.height * 23,
                child: _coursePreviewList(context, TextKeys.recommendedCourses,
                    context.read<HomeViewModel>().recommendedCourses)),
          ],
        ),
      );

  static Widget _coursePreviewList(
          BuildContext context, String coursesType, List<Course> courseList) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseText(coursesType,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          context.sizedH(2),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemCount: courseList.length >= 8 ? 8 : courseList.length,
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
}
