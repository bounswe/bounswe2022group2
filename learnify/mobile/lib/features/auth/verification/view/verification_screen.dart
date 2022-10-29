import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/helpers/selector_helper.dart';
import '../../../../core/widgets/buttons/action_button.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../../../product/constants/icon_keys.dart';
import '../../../../product/language/language_keys.dart';
import '../constants/widget_keys.dart';
import '../view-model/verification_view_model.dart';

part './components/verification_code_field.dart';

class VerificationScreen extends BaseView<VerificationViewModel> {
  VerificationScreen({required String email, Key? key})
      : super(
            builder: (BuildContext context) => _builder(context, email),
            scrollable: true,
            key: key);
  static Widget _builder(BuildContext context, String email) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(IconKeys.logo, width: context.width * 55),
          context.sizedH(8),
          _title(context, TextKeys.verifyYourEmail),
          context.sizedH(1),
          _description(context, TextKeys.verificationDescription),
          context.sizedH(2),
          _userEmailAddress(context, email),
          context.sizedH(2),
          const _VerificationCodeField(),
          context.sizedH(2),
          const VerificationCodeTimer(),
          context.sizedH(2),
          _backToEnterEmail(context)
          //_backToLogin(context),
        ],
      );

  static Widget _title(BuildContext context, String key, {Color? color}) =>
      BaseText(key, style: context.displayLarge, color: color);

  static Widget _description(BuildContext context, String key,
          {Color? color}) =>
      Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 10),
          child: BaseText(key, style: context.displayMedium, color: color));

  static Widget _userEmailAddress(BuildContext context, String key) => Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 10),
      child: Text(key, style: context.titleSmall));

  static Widget _backToEnterEmail(BuildContext context) => BaseText(
        TextKeys.backToPreviousPage,
        style: context.bodySmall,
        onClick: () async => Navigator.pop(context),
        color: context.primary,
      );
}

class VerificationCodeTimer extends StatefulWidget {
  const VerificationCodeTimer({Key? key}) : super(key: key);

  @override
  State<VerificationCodeTimer> createState() => _VerificationCodeTimerState();
}

class _VerificationCodeTimerState extends State<VerificationCodeTimer> {
  int _remainingTime = 15;
  final Duration _duration = const Duration(seconds: 1);
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(_duration, (Timer timer) {
      if (mounted) {
        if (_remainingTime == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _remainingTime--;
          });
        }
      }
    });
  }

  void resetTimer() {
    if (mounted) {
      setState(() {
        _timer.cancel();
        _remainingTime = 15;
        startTimer();
      });
    }
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        BaseText(
          TextKeys.codeNotReceived,
          style: context.bodySmall,
          replaceValues: <ReplaceValue>[
            ReplaceValue(
              TextKeys.requestAnotherCode,
              onClick: () async => {resetTimer()},
              color: context.primary,
            )
          ],
        ),
        context.sizedH(2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BaseText(
              TextKeys.remainingTime,
              style: context.bodySmall,
            ),
            context.sizedW(2),
            Text('$_remainingTime seconds')
          ],
        ),
        context.sizedH(2),
        _verifyButton
      ]);

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget get _verifyButton =>
      SelectorHelper<bool, VerificationViewModel>().builder(
          (_, VerificationViewModel model) => model.canVerify,
          (BuildContext context, bool canVerify, _) => ActionButton(
                text: TextKeys.verify,
                padding: EdgeInsets.symmetric(
                    horizontal: context.responsiveSize * 2.8,
                    vertical: context.responsiveSize * 1.4),
                capitalizeAll: true,
                isActive: canVerify && _remainingTime > 0,
                onPressedError:
                    context.read<VerificationViewModel>().verification,
              ));
}
