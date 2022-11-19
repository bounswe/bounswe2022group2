part of '../../create_learning_space_screen.dart';

class _LearningSpaceForm extends StatelessWidget {
  _LearningSpaceForm({Key? key}) : super(key: key);

  final List<String> _categories = <String>[];

  @override
  Widget build(BuildContext context) {
    final CreateLearningSpaceViewModel model =
        context.read<CreateLearningSpaceViewModel>();
    return Form(
      key: model.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(child: _titleField(model.titleController)),
          context.sizedH(.5),
          Flexible(child: _descriptionField(model.descriptionController)),
          context.sizedH(.5),
          Flexible(child: _participantsField(model.participantsController)),
          Flexible(child: _addedCategories(context, _categories)),
          context.sizedH(1.5),
        ],
      ),
    );
  }

  Widget _titleField(TextEditingController controller) => CustomTextFormField(
        key: CreateLearningSpaceKeys.titleField,
        controller: controller,
        hintText: TextKeys.spaceTitleHint,
        labelText: TextKeys.spaceTitleLabel,
        validator: Validators.name,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.name,
        padding: const EdgeInsets.all(10),
      );

  Widget _descriptionField(TextEditingController controller) =>
      CustomTextFormField(
        key: CreateLearningSpaceKeys.titleField,
        controller: controller,
        hintText: TextKeys.spaceDescriptionHint,
        labelText: TextKeys.spaceDescriptionLabel,
        textInputAction: TextInputAction.newline,
        textInputType: TextInputType.multiline,
        padding: const EdgeInsets.all(10),
      );

  Widget _participantsField(TextEditingController controller) =>
      CustomTextFormField(
        key: CreateLearningSpaceKeys.participantsField,
        labelText: TextKeys.participantLimit,
        textInputType: TextInputType.number,
        controller: controller,
        maxLength: 3,
        padding: const EdgeInsets.all(10),
      );

  Widget _addedCategories(BuildContext context, List<String> tagList) => Row(
        children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          const BaseText(TextKeys.categories),
          Wrap(
              runSpacing: 5,
              spacing: 5,
              children: tagList
                  .map((String tag) => Chip(
                        label: Text(tag),
                        labelPadding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12),
                        backgroundColor: context.primary,
                        onDeleted: () {},
                      ))
                  .toList())
        ],
      );
}
