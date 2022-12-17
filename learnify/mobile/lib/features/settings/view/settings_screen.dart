import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../view-model/settings_view_model.dart';

class SettingsScreen extends BaseView<SettingsViewModel> {
  const SettingsScreen({Key? key}) : super(builder: _builder, key: key);

  static Widget _builder(BuildContext context) {    final int optionLength = SettingsOptions.values.length;

    return Padding(
        padding: EdgeInsets.symmetric(vertical: context.height * 3),
        child: ListView.builder(itemBuilder: (BuildContext context, int i) {}),
      );
  }
}
