import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/widgets/base-icon/base_icon.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/language/language_keys.dart';
import '../../home/model/course_model.dart';
import '../../home/view-model/home_view_model.dart';
import '../../home/view/home_screen.dart';

class ViewAllList extends BaseView<HomeViewModel> {
  ViewAllList(
      {required List<Course> listOfCourses,
      required bool buttonExist,
      Key? key})
      : super(
          builder: (BuildContext context) =>
              _builder(context, listOfCourses, buttonExist),
          scrollable: true,
          key: key,
        );

  static Widget _builder(
          BuildContext context, List<Course> listOfCourses, bool buttonExist) =>
      Padding(
        padding: EdgeInsets.only(
            left: context.width * 4,
            top: context.height * 1,
            bottom: context.height * 3,
            right: context.width * 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (buttonExist) _createSpaceButton(context),
            if (buttonExist) context.sizedH(3),
            GridView.builder(
              physics: const ScrollPhysics(),
              itemCount: 15,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  const CoursePreview(
                      textKey: "Learning Space",
                      //ToDo after the courses are initialized:
                      //listOfCourses[index].name ?? ''
                      participantNumber: 100
                      //ToDo after the courses are initialized:
                      //listOfCourses[index].numParticipants ?? 0
                      ),
            ),
          ],
        ),
      );

  static Widget _createSpaceButton(BuildContext context) => Padding(
      padding: EdgeInsets.only(
        top: context.height * 1.7,
        left: context.width * 20,
        right: context.width * 20,
      ),
      child: ActionButton(
        icon: BaseIcon(context, Icons.add_outlined),
        text: TextKeys.createLearningSpace,
        height: context.height * 4.8,
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 2.8,
            vertical: context.responsiveSize * 1.4),
        onPressed: () async => NavigationManager.instance.navigateToPage(
            path: NavigationConstants.createEditLearningSpace,
            data: <String, dynamic>{'isCreate': true}),
      ));
}
