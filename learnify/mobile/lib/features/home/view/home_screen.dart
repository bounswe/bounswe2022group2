import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/theme/dark_theme.dart';
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

  static Widget _builder(BuildContext context) => const Center(
          child: _CoursePreview(
        textKey: 'Latte Art',
        participantNumber: 15,
      ));
}
