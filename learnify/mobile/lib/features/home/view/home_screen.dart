import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../product/constants/icon_keys.dart';
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
              context.read<HomeViewModel>().getCourses(),
          key: key,
        );

  static Widget _builder(BuildContext context) => Column(children: [
        _coursePreviewList(context, 'Taken Courses',
            context.read<HomeViewModel>().takenCourses),
        context.sizedH(1),
        _coursePreviewList(context, "Friends Courses",
            context.read<HomeViewModel>().friendCourses),
        context.sizedH(1),
        _coursePreviewList(context, 'Recommended Courses',
            context.read<HomeViewModel>().recommendedCourses),
      ]);

  static Widget _coursePreviewList(
          BuildContext context, String coursesType, List<Course> courseList) =>
      Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Text(coursesType,
                textAlign: TextAlign.left,
                style: const TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis),
          ),
          context.sizedH(.5),
          SizedBox(
              height: context.height * 10,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                separatorBuilder: (BuildContext context, _) => SizedBox(
                  width: context.width * 0.1,
                ),
                itemBuilder: (BuildContext context, int index) =>
                    _CoursePreview(
                        textKey: courseList[index].name ?? '',
                        participantNumber:
                            courseList[index].numParticipants ?? 0),
              ))
        ],
      );
}
