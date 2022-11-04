part of '../verification_screen.dart';

class _VerificationCodeField extends StatelessWidget {
  const _VerificationCodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VerificationViewModel model = context.read<VerificationViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
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
        width: context.width * 20,
        child: TextFormField(
          onChanged: (String value) {
            if (value.length == 1 &&
                key != VerificationKeys.verificationCodeFourthDigitField) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty &&
                key != VerificationKeys.verificationCodeFirstDigitField) {
              FocusScope.of(context).previousFocus();
            }
          },
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      );
}
