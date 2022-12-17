import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/widgets/text/base_text.dart';
import '../constants/settings_constants.dart';
import '../constants/settings_options.dart';
import '../view-model/settings_view_model.dart';

class SettingsScreen extends BaseView<SettingsViewModel> {
  const SettingsScreen({Key? key}) : super(builder: _builder, key: key);

  static Widget _builder(BuildContext context) {
    final int optionLength = SettingsOptions.values.length;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 3),
      child: ListView.builder(
        itemCount: optionLength + 1,
        itemBuilder: (BuildContext context, int index) => index == optionLength
            ? Padding(
                padding: EdgeInsets.only(top: context.height * 2),
                child: const BaseText(SettingsTexts.madeBy, translated: false),
              )
            : Column(
                children: const <Widget>[
                  // _SettingsItem(settings: SettingsOptions.values[index]),
                  // const CustomDivider(),
                ],
              ),
      ),
    );
  }
}
