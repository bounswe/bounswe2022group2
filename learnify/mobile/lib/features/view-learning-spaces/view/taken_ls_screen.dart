import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../../home/model/course_model.dart';
import '../../home/view-model/home_view_model.dart';
import 'view_all_list.dart';

class TakenLsScreen extends BaseView<HomeViewModel> {
  TakenLsScreen({Key? key})
      : super(
          builder: _builder,
          futureInit: (BuildContext context) =>
              context.read<HomeViewModel>().fetchInitialCourses(),
          key: key,
        );

  static Widget _builder(BuildContext context) {
    final List<Course> listOfCourses =
        context.read<HomeViewModel>().takenCourses;
    return ViewAllList(
      listOfCourses: listOfCourses,
      buttonExist: true,
    );
  }
}
