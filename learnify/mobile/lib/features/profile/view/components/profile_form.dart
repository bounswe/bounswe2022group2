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
            child: BaseText(model.email ?? 'hasanarisan@gmail.com',
                translated: false)),
        context.sizedH(1.5),
        Form(
          key: model.userFormKey,
          child: Flexible(child: _usernameField(model.usernameController)),
        ),
        context.sizedH(1.5),
        Form(
          key: model.biographyFormKey,
          child: Flexible(child: _biographyField(model.biographyController)),
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

  Widget _biographyField(TextEditingController controller) =>
      CustomTextFormField(
        maxLines: 8,
        key: ProfileKeys.biographyField,
        controller: controller,
        hintText: TextKeys.addBiographyHint,
        labelText: TextKeys.biography,
        prefixIcon: Icons.contact_support_outlined,
        textInputAction: TextInputAction.newline,
        textInputType: TextInputType.multiline,
        maxLength: 200,
        padding: const EdgeInsets.all(10),
      );
}
