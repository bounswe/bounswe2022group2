import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../view-model/courses_view_model.dart';

class CoursesScreen extends BaseView<CoursesViewModel> {
  const CoursesScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          hasScaffold: false,
          key: key,
        );

  static Widget _builder(BuildContext context) =>
      const Center(child: Text('Courses'));
}
