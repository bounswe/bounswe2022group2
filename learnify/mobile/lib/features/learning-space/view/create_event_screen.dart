import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/language/language_keys.dart';
import '../constants/widget_keys.dart';
import '../view-model/learning_space_view_model.dart';

part 'components/create/event_form.dart';

class CreateEventScreen extends BaseView<LearningSpaceViewModel> {
  const CreateEventScreen({Key? key})
      : super(
            builder: _builder,
            appBar: _appBarBuilder,
            key: key,
            scrollable: true);

  static Widget _builder(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          context.sizedH(2.6),
          const _EventForm(),
          _dateTimePickerField(context),
          context.sizedH(.8),
          _doneButton()
        ],
      );

  static DefaultAppBar _appBarBuilder(BuildContext context) => DefaultAppBar(
        size: context.height * 6,
        color: context.lightDarkActiveColor,
        actionsList: <Widget>[
          Padding(
            padding: EdgeInsets.all(context.responsiveSize * .6),
          ),
          BaseIconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icons.arrow_back_outlined,
            color: context.lightDarkActiveColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: context.width * 4),
            child: BaseText(
              TextKeys.createEvent,
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

  static Widget _dateTimePickerField(BuildContext context) {
    final LearningSpaceViewModel model = context.read<LearningSpaceViewModel>();
    return Container(
        width: context.maxPossibleWidth,
        margin: EdgeInsets.symmetric(horizontal: context.width * 7),
        child: Padding(
          padding: EdgeInsets.all(context.width * 4),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary),
            child: SelectorHelper<bool, LearningSpaceViewModel>().builder(
              (_, LearningSpaceViewModel lsViewModel) =>
                  lsViewModel.isDateSelected,
              (_, bool val, __) => val
                  ? Text(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      "${model.dateTime?.day}/${model.dateTime?.month}/${model.dateTime?.year} (dd/mm/yyyy)\n${model.dateTime?.hour.toString().padLeft(2, '0')}:${model.dateTime?.minute.toString().padLeft(2, '0')} (hh:mm)")
                  : BaseText(TextKeys.selectDateTime,
                      style: context.titleMedium,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
            ),
            onPressed: () async {
              model.resetIsDateSelected();
              final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: model.dateTime ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100));

              if (selectedDate == null) {
                model.setIsDateSelected();
                return;
              }

              final TimeOfDay? selectedTime = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());

              if (selectedTime == null) {
                model.setIsDateSelected();
                return;
              }
              model.pickDateTime(selectedDate, selectedTime);
            },
          ),
        ));
  }

  static Widget _doneButton() =>
      SelectorHelper<bool, LearningSpaceViewModel>().builder(
          (_, LearningSpaceViewModel model) => model.canCreate,
          (BuildContext context, bool canUpdate, _) => ActionButton(
              text: TextKeys.done,
              padding: EdgeInsets.symmetric(
                  horizontal: context.responsiveSize * 2.8,
                  vertical: context.responsiveSize * 1.4),
              capitalizeAll: true,
              isActive: canUpdate,
              onPressedError: () async {}));
}
