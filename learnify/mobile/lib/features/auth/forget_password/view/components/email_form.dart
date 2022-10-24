part of '../forget_password_screen.dart';

class _EmailForm extends StatelessWidget {
  const _EmailForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordViewModel model =
        context.read<ForgetPasswordViewModel>();
    return Form(key: model.formKey, child: _emailField(model.emailController));
  }

  static Widget _emailField(TextEditingController controller) =>
      CustomTextFormField(
        key: ForgetPasswordKeys.emailField,
        controller: controller,
        hintText: TextKeys.emailHint,
        labelText: TextKeys.emailLabel,
        prefixIcon: Icons.email_outlined,
        validator: Validators.email,
        textInputAction: TextInputAction.next,
        autofillHints: const <String>[AutofillHints.email],
        textInputType: TextInputType.emailAddress,
      );
}
