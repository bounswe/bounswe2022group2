import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../view-model/profile_view_model.dart';

class ProfileScreen extends BaseView<ProfileViewModel> {
  const ProfileScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          hasScaffold: false,
          key: key,
        );

  static Widget _builder(BuildContext context) =>
      const Center(child: Text('Profile'));
}
