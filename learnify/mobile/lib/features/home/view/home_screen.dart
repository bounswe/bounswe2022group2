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
                  context.read<HomeViewModel>().takenCourses),
            ),
            context.sizedH(3),
            SizedBox(
              height: context.height * 23,
              child: _coursePreviewList(context, TextKeys.friendLearnifies,
                  context.read<HomeViewModel>().friendCourses),
            ),
            context.sizedH(3),
            SizedBox(
                height: context.height * 23,
                child: _coursePreviewList(
                    context,
                    TextKeys.recommendedLearnifies,
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
          context.sizedH(.8),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: courseList.length >= 8 ? 8 : courseList.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, _) =>
                  SizedBox(width: context.width * 3),
              itemBuilder: (BuildContext context, int index) => _CoursePreview(
                  textKey: courseList[index].name ?? '',
                  participantNumber: courseList[index].numParticipants ?? 0),
            ),
          )
        ],
      );
}
