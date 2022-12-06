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
import '../../../product/constants/icon_keys.dart';
import '../../../product/language/language_keys.dart';
import '../../../product/theme/light_theme.dart';
import '../../home/view-model/home_view_model.dart';
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
          futureInit: (BuildContext context) => context
              .read<CreateLearningSpaceViewModel>()
              .fetchInitialCategories(),
          scrollable: true,
        );

  static Widget _builder(
          BuildContext context, bool isCreate, LearningSpace? learningSpace) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _lsIcon,
          context.sizedH(.8),
          _iconSelector(),
          context.sizedH(2.6),
          const _LearningSpaceForm(),
          const _AddCategories(),
          context.sizedH(.8),
          _doneButton(isCreate),
        ],
      );

  static Widget get _lsIcon =>
      SelectorHelper<int?, CreateLearningSpaceViewModel>().builder(
        (_, CreateLearningSpaceViewModel model) => model.selectedImage,
        (BuildContext context, int? selectedImage, __) {
          ImageProvider imageProvider = AssetImage(IconKeys.lsIcons[13]);
          if (selectedImage != null) {
            final String image = IconKeys.lsIcons[selectedImage];
            imageProvider = AssetImage(image);
          }
          return CircleAvatar(
            foregroundImage: imageProvider,
            radius: context.width * 12,
            foregroundColor: LightAppTheme.lightBlue,
            backgroundColor: LightAppTheme.lightBlue,
          );
        },
      );

  static Widget _iconSelector() =>
      SelectorHelper<int?, CreateLearningSpaceViewModel>().builder(
        (_, CreateLearningSpaceViewModel model) => model.selectedImage,
        (BuildContext context, int? selectedImage, __) => IconButton(
            onPressed: context.read<CreateLearningSpaceViewModel>().pickIcon,
            icon: const Icon(Icons.photo)),
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
                onPressedError: () async {
                  final CreateLearningSpaceViewModel viewModel =
                      context.read<CreateLearningSpaceViewModel>();
                  final HomeViewModel homeModel = context.read<HomeViewModel>();
                  final String? res = await (isCreate
                      ? viewModel.createLearningSpace()
                      : viewModel.editLearningSpace());
                  homeModel.addLs(viewModel.learningSpace);
                  return res;
                },
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
