import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../view-model/home_view_model.dart';

class HomeScreen extends BaseView<HomeViewModel> {
  const HomeScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          hasScaffold: false,
          key: key,
        );

  static Widget _builder(BuildContext context) =>
      const Center(child: Text('HOME'));
}
