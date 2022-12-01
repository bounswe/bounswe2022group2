import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../product/language/language_keys.dart';
import '../constants/widget_keys.dart';
import '../models/learning_space_model.dart';
import '../view-model/create_learning_space_view_model.dart';
import 'learning_space_detail_screen.dart';

part './components/create/add_categories.dart';
part './components/create/learning_space_form.dart';

class CreateLearningSpaceScreen extends BaseView<CreateLearningSpaceViewModel> {
  CreateLearningSpaceScreen(
      {required bool isCreate, LearningSpace? learningSpace, Key? key})
      : super(
          builder: (BuildContext context) =>
              _builder(context, isCreate, learningSpace),
          appBar: (BuildContext context) => _appBarBuilder(context, isCreate),
          key: key,
          scrollable: true,
        );

  static Widget _builder(
          BuildContext context, bool isCreate, LearningSpace? learningSpace) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          context.sizedH(2.6),
          const _LearningSpaceForm(),
          const _AddCategories(),
          context.sizedH(.8),
          _doneButton(isCreate),
        ],
      );

  static Widget _doneButton(bool isCreate) =>
      SelectorHelper<bool, CreateLearningSpaceViewModel>().builder(
          (_, CreateLearningSpaceViewModel model) => model.canUpdate,
          (BuildContext context, bool canUpdate, _) => ActionButton(
                text: TextKeys.done,
                padding: EdgeInsets.symmetric(
                    horizontal: context.responsiveSize * 2.8,
                    vertical: context.responsiveSize * 1.4),
                capitalizeAll: true,
                isActive: canUpdate,
                onPressedError: isCreate
                    ? context
                        .read<CreateLearningSpaceViewModel>()
                        .createLearningSpace
                    : context
                        .read<CreateLearningSpaceViewModel>()
                        .editLearningSpace,
              ));

  static DefaultAppBar _appBarBuilder(BuildContext context, bool isCreate) =>
      DefaultAppBar(
        size: context.height * 6,
        color: context.lightActiveColor,
        actionsList: <Widget>[
          Padding(
            padding: EdgeInsets.all(context.responsiveSize * .6),
          ),
          BaseIconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icons.arrow_back_outlined,
            color: context.lightActiveColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: context.width * 4),
            child: BaseText(
              isCreate
                  ? TextKeys.createLearningSpace
                  : TextKeys.editLearningSpace,
              style: context.titleMedium,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 3,
            vertical: context.responsiveSize * 2.5),
      );
}
