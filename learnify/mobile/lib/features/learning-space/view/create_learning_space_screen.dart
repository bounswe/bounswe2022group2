import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/constants/main_type_definitions.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/widgets/base-icon/base_icon.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/dialog/dialog_builder.dart';
import '../../../core/widgets/divider/custom_divider.dart';
import '../../../core/widgets/image/custom_network_image.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
import '../../../core/widgets/text/multiline_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/language/language_keys.dart';
import '../constants/learning_space_constants.dart';
import '../view-model/create_learning_space_view_model.dart';
import '../view-model/learning_space_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/helpers/selector_helper.dart';
import '../../../../core/helpers/url_launcher_helper.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/managers/navigation/navigation_manager.dart';
import '../../../../core/widgets/buttons/action_button.dart';
import '../../../../core/widgets/checkbox/custom_checkbox_tile.dart';
import '../../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../../core/widgets/text-field/obscured_text_form_field.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../../../product/constants/icon_keys.dart';
import '../../../../product/constants/link_keys.dart';
import '../../../../product/constants/navigation_constants.dart';
import '../../../../product/language/language_keys.dart';
import '../constants/widget_keys.dart';

part './components/create/learning_space_form.dart';

class CreateLearningSpaceScreen extends BaseView<CreateLearningSpaceViewModel> {
  const CreateLearningSpaceScreen({Key? key})
      : super(
          builder: _builder,
          resizeToAvoidBottomInset: false,
          key: key,
        );

  static Widget _builder(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _title(context, TextKeys.createLearningSpace),
          context.sizedH(2.6),
          const _LearningSpaceForm(),
          context.sizedH(.8),
          //_actionButton
        ],
      );

  static Widget _title(BuildContext context, String key, {Color? color}) =>
      BaseText(key, style: context.displayLarge, color: color);
}
