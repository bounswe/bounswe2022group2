part of '../signup_screen.dart';

class _SignupForm extends StatelessWidget {
  const _SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupViewModel model = context.read<SignupViewModel>();
    return Form(
      key: model.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(child: _usernameField(model.usernameController)),
          context.sizedH(.5),
          Flexible(child: _emailField(model.emailController)),
          context.sizedH(.5),
          Flexible(
            child: _passwordField(model.passwordController),
          ),
        ],
      ),
    );
  }

  Widget _emailField(TextEditingController controller) => CustomTextFormField(
        controller: controller,
        hintText: TextKeys.emailHint,
        labelText: TextKeys.emailLabel,
        prefixIcon: Icons.email_outlined,
        validator: Validators.email,
        textInputAction: TextInputAction.next,
        autofillHints: const <String>[AutofillHints.email],
        textInputType: TextInputType.emailAddress,
      );

  Widget _usernameField(TextEditingController controller) =>
      CustomTextFormField(
        controller: controller,
        hintText: TextKeys.usernameHint,
        labelText: TextKeys.usernameLabel,
        prefixIcon: Icons.person_outline,
        validator: Validators.username,
        textInputAction: TextInputAction.next,
        autofillHints: const <String>[AutofillHints.username],
        textInputType: TextInputType.name,
      );

  Widget _passwordField(TextEditingController controller) =>
      ObscuredTextFormField(
        controller: controller,
        hintText: TextKeys.passwordHint,
        labelText: TextKeys.passwordLabel,
        prefixIcon: Icons.password_outlined,
        textInputAction: TextInputAction.next,
        validator: Validators.password,
      );
}
