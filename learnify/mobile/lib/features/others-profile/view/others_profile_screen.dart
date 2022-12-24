import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/widgets/text/base_text.dart';
import '../view-model/others_profile_view_model.dart';

class OthersProfileScreen extends BaseView<OthersProfileViewModel> {
  OthersProfileScreen({required String username, Key? key})
      : super(
          builder: (BuildContext context) => _builder(context, username),
          scrollable: true,
          hasScaffold: false,
          key: key,
        );

  static Widget _builder(BuildContext context, String username) => Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 3),
      child: BaseText(username));
}
