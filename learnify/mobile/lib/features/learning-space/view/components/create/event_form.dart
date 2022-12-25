part of '../../create_event_screen.dart';

class _EventForm extends StatelessWidget {
  const _EventForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LearningSpaceViewModel model = context.read<LearningSpaceViewModel>();
    return Form(
      key: model.createEventFormKey,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Flexible(
            child: SingleChildScrollView(
          child: _titleField(model.eventTitleController),
        )),
        context.sizedH(.5),
        Flexible(
            child: SingleChildScrollView(
          child: _descriptionField(model.eventDescriptionController),
        )),
        context.sizedH(.5),
        Flexible(
            child: SingleChildScrollView(
          child:
              _participationLimitField(model.eventParticipationLimitController),
        )),
        context.sizedH(.5),
        Flexible(
            child: SingleChildScrollView(
          child: _durationField(model.eventDurationController),
        )),
        context.sizedH(1.5),
      ]),
    );
  }

  Widget _titleField(TextEditingController controller) => CustomTextFormField(
        maxLines: 1,
        key: CreateEventKeys.titleField,
        controller: controller,
        hintText: TextKeys.createEventTitleHint,
        labelText: TextKeys.createEventTitleLabel,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.text,
        padding: const EdgeInsets.all(10),
      );

  Widget _descriptionField(TextEditingController controller) =>
      CustomTextFormField(
        maxLines: 8,
        key: CreateEventKeys.descriptionField,
        controller: controller,
        hintText: TextKeys.createEventDescriptionHint,
        labelText: TextKeys.createEventDescriptionLabel,
        textInputAction: TextInputAction.newline,
        textInputType: TextInputType.multiline,
        padding: const EdgeInsets.all(10),
      );

  Widget _participationLimitField(TextEditingController controller) =>
      CustomTextFormField(
        maxLines: 1,
        key: CreateEventKeys.participationLimitField,
        controller: controller,
        hintText: TextKeys.createEventParticipationLimitHint,
        labelText: TextKeys.createEventParticipationLimitLabel,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.number,
        padding: const EdgeInsets.all(10),
      );

  Widget _durationField(TextEditingController controller) =>
      CustomTextFormField(
        maxLines: 1,
        key: CreateEventKeys.durationField,
        controller: controller,
        hintText: TextKeys.createEventDurationHint,
        labelText: TextKeys.createEventDurationLabel,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.number,
        padding: const EdgeInsets.all(10),
      );
}
