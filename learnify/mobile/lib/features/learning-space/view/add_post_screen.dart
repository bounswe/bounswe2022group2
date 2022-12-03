import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/helpers/validators.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/language/language_keys.dart';
import '../constants/widget_keys.dart';
import '../models/post_model.dart';
import '../view-model/add_post_view_model.dart';

part 'components/create/post_form.dart';

class AddPostScreen extends BaseView<AddPostViewModel> {
  AddPostScreen({required bool isAdd, Post? post, Key? key})
      : super(
            builder: (BuildContext context) => _builder(context, isAdd, post),
            appBar: (BuildContext context) => _appBarBuilder(context, isAdd),
            voidInit: (BuildContext context) =>
                context.read<AddPostViewModel>().post = post,
            key: key,
            scrollable: true);

  static Widget _builder(BuildContext context, bool isAdd, Post? post) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          context.sizedH(2.6),
          const _PostForm(),
          context.sizedH(.8),
          _doneButton(isAdd),
        ],
      );

  static DefaultAppBar _appBarBuilder(BuildContext context, bool isAdd) =>
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
              isAdd ? TextKeys.addPost : TextKeys.editPost,
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

  static Widget _doneButton(bool isAdd) =>
      SelectorHelper<bool, AddPostViewModel>().builder(
          (_, AddPostViewModel model) => model.canUpdate,
          (BuildContext context, bool canUpdate, _) => ActionButton(
              text: TextKeys.done,
              padding: EdgeInsets.symmetric(
                  horizontal: context.responsiveSize * 2.8,
                  vertical: context.responsiveSize * 1.4),
              capitalizeAll: true,
              isActive: canUpdate,
              onPressedError: () {}));
}
