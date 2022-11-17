part of '../../create_learning_space_screen.dart';

class _LearningSpaceForm extends StatelessWidget {
  const _LearningSpaceForm({Key? key}) : super(key: key);

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
          // Flexible(child: _descriptionField(model.descriptionController)),
          context.sizedH(.5),
          // Flexible(child: _passwordField(context, model.passwordController)),
        ],
      ),
    );
  }

  Widget _titleField(TextEditingController controller) => CustomTextFormField(
        key: CreateLearningSpaceKeys.titleField,
        controller: controller,
        hintText: TextKeys.titleHint,
        labelText: TextKeys.emailLabel,
        prefixIcon: Icons.email_outlined,
        validator: Validators.email,
        textInputAction: TextInputAction.next,
        autofillHints: const <String>[AutofillHints.email],
        textInputType: TextInputType.emailAddress,
      );
}
