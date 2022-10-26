part of '../profile_screen.dart';

class _ProfileForm extends StatelessWidget {
  const _ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileViewModel model = context.read<ProfileViewModel>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
            child: BaseText(model.email.isEmpty ? 'hasanarisan@gmail.com' : '',
                translated: false)),
        context.sizedH(1.5),
        Form(
          key: model.formKey,
          child: Flexible(child: _usernameField(model.usernameController)),
        ),
      ],
    );
  }

  Widget _usernameField(TextEditingController controller) =>
      CustomTextFormField(
        key: ProfileKeys.usernameField,
        controller: controller,
        hintText: TextKeys.usernameHint,
        labelText: TextKeys.usernameLabel,
        prefixIcon: Icons.person_outline,
        validator: Validators.username,
        textInputAction: TextInputAction.next,
        autofillHints: const <String>[AutofillHints.username],
        textInputType: TextInputType.name,
      );
}
