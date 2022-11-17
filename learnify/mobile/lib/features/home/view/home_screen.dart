import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/managers/navigation/navigation_manager.dart';
import '../../../../product/constants/navigation_constants.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/widgets/base-icon/base_icon.dart';
import '../../../core/widgets/buttons/action_button.dart';
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
            _createEditButton(
                context, TextKeys.createLearningSpace, Icons.add_outlined),
            context.sizedH(2),
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

  static Widget _createEditButton(
          BuildContext context, String textKey, IconData icon) =>
      Padding(
          padding: EdgeInsets.only(
            top: context.height * 1.7,
            bottom: context.height * .3,
            left: context.width * 20,
            right: context.width * 20,
          ),
          child: ActionButton(
            icon: BaseIcon(context, icon),
            text: textKey,
            height: context.height * 4.8,
            padding: EdgeInsets.symmetric(
                horizontal: context.responsiveSize * 2.8,
                vertical: context.responsiveSize * 1.4),
            onPressed: () async => NavigationManager.instance.navigateToPage(
                path: NavigationConstants.createEditLearningSpace),
          ));
}
