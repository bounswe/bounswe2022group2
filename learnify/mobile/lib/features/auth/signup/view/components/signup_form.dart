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
          // Flexible(child: _usernameField(model.emailController)),
          Flexible(child: _emailField(model.emailController)),
          // Flexible(
          //   child: _passwordField(model.passwordController),
          // ),
        ],
      ),
    );
  }

  Widget _emailField(TextEditingController controller) => CustomTextFormField(
        controller: controller,
        hintText: TextKeys.emailHint,
        labelText: TextKeys.emailLabel,
        prefixIcon: Icons.person_outline,
        validator: Validators.email,
        textInputAction: TextInputAction.next,
        autofillHints: const <String>[AutofillHints.email],
        textInputType: TextInputType.emailAddress,
      );
}
