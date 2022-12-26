import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/language/language_keys.dart';
import '../../home/view-model/home_view_model.dart';
import '../constants/widget_keys.dart';
import '../models/geolocation/geolocation_model.dart';
import '../view-model/learning_space_view_model.dart';

part 'components/create/event_form.dart';

class CreateEventScreen extends BaseView<LearningSpaceViewModel> {
  CreateEventScreen({Key? key})
      : super(
            builder: _builder,
            appBar: _appBarBuilder,
            futureInit: (BuildContext context) async =>
                context.read<LearningSpaceViewModel>().setInitialGeolocation(),
            key: key,
            scrollable: true);

  static Widget _builder(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          context.sizedH(2.6),
          const _EventForm(),
          _dateTimePickerField(context),
          _geolocationField(context),
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

              if (selectedDate == null || passedDate(selectedDate)) {
                model.setIsDateSelected();
                return;
              }

              final TimeOfDay? selectedTime = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());

              if (selectedTime == null ||
                  (isToday(selectedDate) && passedTime(selectedTime))) {
                model.setIsDateSelected();
                return;
              }

              model.pickDateTime(selectedDate, selectedTime);
            },
          ),
        ));
  }

  static Widget _geolocationSelectionField(BuildContext context) {
    final LearningSpaceViewModel model = context.read<LearningSpaceViewModel>();
    return Padding(
        padding: EdgeInsets.only(top: context.height * 1.8),
        child: SizedBox(
          height: context.height * 22,
          child: SelectorHelper<Marker, LearningSpaceViewModel>().builder(
            (_, LearningSpaceViewModel lsViewModel) => Marker(
                width: context.width * 12,
                height: context.width * 12,
                point: LatLng(
                    model.geolocation.latitude, model.geolocation.longitude),
                builder: (_) => Image.asset(IconKeys.locationMarker)),
            (_, Marker marker, __) => FlutterMap(
              options: MapOptions(
                  center: marker.point,
                  maxZoom: 19,
                  onTap: (TapPosition tapPosition, LatLng latlng) {
                    model.setGeolocation(latlng.latitude, latlng.longitude);
                  }),
              children: <Widget>[
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.bounswe.learnify',
                ),
                MarkerLayer(
                  markers: <Marker>[
                    Marker(
                      width: context.width * 12,
                      height: context.width * 12,
                      point: marker.point,
                      builder: (_) => Image.asset(IconKeys.locationMarker),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  static Widget _geolocationField(BuildContext context) => Container(
      width: context.maxPossibleWidth,
      margin: EdgeInsets.symmetric(horizontal: context.width * 7),
      child: Padding(
        padding: EdgeInsets.all(context.width * 2),
        child: SelectorHelper<GeoLocation, LearningSpaceViewModel>().builder(
            (_, LearningSpaceViewModel lsViewModel) => lsViewModel.geolocation,
            (_, GeoLocation geolocation, __) => Column(
                  children: <Widget>[
                    _geolocationSelectionField(context),
                    Row(
                      children: <Widget>[
                        BaseText(TextKeys.currentLatitude,
                            style: context.titleSmall, color: Colors.black),
                        context.sizedW(2),
                        Text("${geolocation.latitude}")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        BaseText(TextKeys.currentLongitude,
                            style: context.titleSmall, color: Colors.black),
                        context.sizedW(2),
                        Text("${geolocation.longitude}")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        BaseText(TextKeys.currentAccuracy,
                            style: context.titleSmall, color: Colors.black),
                        context.sizedW(2),
                        Text("${geolocation.accuracy}")
                      ],
                    ),
                  ],
                )),
      ));

  static Widget _doneButton() =>
      SelectorHelper<bool, LearningSpaceViewModel>().builder(
          (_, LearningSpaceViewModel model) => model.canCreate,
          (BuildContext context, bool canCreate, _) => ActionButton(
              text: TextKeys.done,
              padding: EdgeInsets.symmetric(
                  horizontal: context.responsiveSize * 2.8,
                  vertical: context.responsiveSize * 1.4),
              capitalizeAll: true,
              isActive: canCreate,
              onPressedError: () async {
                final HomeViewModel homeViewModel =
                    context.read<HomeViewModel>();
                final LearningSpaceViewModel spaceViewModel =
                    context.read<LearningSpaceViewModel>();
                await spaceViewModel.createEvent();
                homeViewModel.updateLs(spaceViewModel.learningSpace);
                NavigationManager.instance.pop();
                return null;
              }));
}

bool passedDate(DateTime date) {
  final DateTime currentDate = DateTime.now();
  if (date.year < currentDate.year) return true;

  if (date.year == currentDate.year) {
    if (date.month < currentDate.month) return true;

    if (date.month == currentDate.month) {
      return date.day < currentDate.day;
    }
  }

  return false;
}

bool passedTime(TimeOfDay time) {
  final TimeOfDay currentTime = TimeOfDay.now();
  if (time.hour < currentTime.hour) return true;

  if (time.hour == currentTime.hour) {
    if (time.minute < currentTime.minute) return true;
  }

  return false;
}

bool isToday(DateTime date) {
  final DateTime currentDate = DateTime.now();
  return currentDate.year == date.year &&
      currentDate.month == date.month &&
      currentDate.day == date.day;
}
