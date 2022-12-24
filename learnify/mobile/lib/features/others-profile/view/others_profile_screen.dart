import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/widgets/text/base_text.dart';
import '../view-model/others_profile_view_model.dart';

class ProfileScreen extends BaseView<OthersProfileViewModel> {
  const ProfileScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          hasScaffold: false,
          key: key,
        );

  static Widget _builder(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 3),
      child: const BaseText('othersProfile'));
}
