part of '../login_screen.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginViewModel model = context.read<LoginViewModel>();
    return Form(
      key: model.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(child: _emailField(model.emailController)),
          context.sizedH(.5),
          Flexible(child: _passwordField(context, model.passwordController)),
        ],
      ),
    );
  }

  Widget _emailField(TextEditingController controller) => CustomTextFormField(
        key: LoginKeys.emailField,
        controller: controller,
        hintText: TextKeys.emailHint,
        labelText: TextKeys.emailLabel,
        prefixIcon: Icons.email_outlined,
        validator: Validators.email,
        textInputAction: TextInputAction.next,
        autofillHints: const <String>[AutofillHints.email],
        textInputType: TextInputType.emailAddress,
      );

  Widget _passwordField(
          BuildContext context, TextEditingController controller) =>
      ObscuredTextFormField(
        key: LoginKeys.passwordField,
        controller: controller,
        hintText: TextKeys.passwordHint,
        labelText: TextKeys.passwordLabel,
        prefixIcon: Icons.password_outlined,
        textInputAction: TextInputAction.next,
        validator: Validators.password,
        onFieldSubmitted: context.read<LoginViewModel>().onPasswordSubmit,
      );
}
