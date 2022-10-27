part of '../verification_screen.dart';

class _VerificationCodeField extends StatelessWidget {
  const _VerificationCodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VerificationViewModel model = context.read<VerificationViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _verificationCodeDigitField(
            context,
            model.verificationCodeFirstDigitController,
            VerificationKeys.verificationCodeFirstDigitField),
        _verificationCodeDigitField(
            context,
            model.verificationCodeSecondDigitController,
            VerificationKeys.verificationCodeSecondDigitField),
        _verificationCodeDigitField(
            context,
            model.verificationCodeThirdDigitController,
            VerificationKeys.verificationCodeThirdDigitField),
        _verificationCodeDigitField(
            context,
            model.verificationCodeFourthDigitController,
            VerificationKeys.verificationCodeFourthDigitField),
      ],
    );
  }

  static Widget _verificationCodeDigitField(
          BuildContext context, TextEditingController controller, Key key) =>
      SizedBox(
        key: key,
        height: 68,
        width: 64,
        child: TextFormField(
          onChanged: (String value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          //onSaved: (verificationCode) {},
          controller: controller,
          //textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      );
}
