import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/language/language_keys.dart';
import '../../home/view/home_screen.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/managers/network/custom_interceptors.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../home-wrapper/view-model/home_wrapper_view_model.dart';
import '../../home/model/course_model.dart';
import '../../home/view-model/home_view_model.dart';

class ViewAllScreen extends BaseView<HomeViewModel> {
  ViewAllScreen(
      {required List<Course> listOfCourses,
      required String coursesType,
      Key? key})
      : super(
          builder: (BuildContext context) =>
              _builder(context, listOfCourses, coursesType),
          appBar: _appBarBuilder,
          scrollable: true,
          key: key,
        );

  static Widget _builder(BuildContext context, List<Course> listOfCourses,
          String coursesType) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: context.width * 4,
                top: context.height * 3,
                bottom: context.height * 3,
                right: context.width * 1),
            child: _title(context, coursesType),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: context.width * 4,
                bottom: context.height * 3,
                right: context.width * 1),
            child: GridView.builder(
                physics: const ScrollPhysics(),
                itemCount: 15,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                shrinkWrap: true,

                // ignore: prefer_expression_function_bodies
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: context.activeColor,
                    child: const Center(
                      child: Text("data"),
                    ),
                  );
                } /*CoursePreview(
                textKey: listOfCourses[index].name ?? '',
                participantNumber: listOfCourses[index].numParticipants ?? 0), */
                ),
          ),
        ],
      );

  static Widget _title(BuildContext context, String key, {Color? color}) =>
      BaseText(key,
          style: context.titleMedium,
          color: color,
          fontWeight: FontWeight.bold);

  static DefaultAppBar _appBarBuilder(BuildContext context) => DefaultAppBar(
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
        ],
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 3,
            vertical: context.responsiveSize * 2.5),
      );
}
