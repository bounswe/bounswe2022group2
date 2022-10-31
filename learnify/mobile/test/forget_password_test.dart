import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:http_mock_adapter/src/handlers/request_handler.dart';
import 'package:learnify/core/constants/network_constants.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/core/widgets/text-field/custom_text_form_field.dart';
import 'package:learnify/features/auth/forget-password/constants/widget_keys.dart';
import 'package:learnify/features/auth/forget-password/view/forget_password_screen.dart';

import 'test_helpers.dart';

void main() {
  testWidgets(
    "Test widgets of forget password screen",
    (WidgetTester tester) async {
      const ForgetPasswordScreen forgetPasswordScreen = ForgetPasswordScreen();
      await tester.pumpWidget(TestHelpers.appWidget(forgetPasswordScreen));

      final Finder buttonFinder = find.byType(ActionButton);
      expect(buttonFinder, findsOneWidget);
      ActionButton button = tester.widget(buttonFinder) as ActionButton;

      final Finder formFinder = find.byType(Form);
      expect(formFinder, findsOneWidget);
      final Form form = tester.widget(formFinder) as Form;

      final GlobalKey<FormState>? formKey = form.key as GlobalKey<FormState>?;
      expect(button.isActive, false);
      expect(formKey?.currentState?.validate(), false);

      final Finder emailFinder = find.byKey(ForgetPasswordKeys.emailField);
      expect(emailFinder, findsOneWidget);
      final CustomTextFormField emailField =
          tester.widget(emailFinder) as CustomTextFormField;

      emailField.controller?.text = "not-a-mail";
      await tester.pumpAndSettle();
      expect(formKey?.currentState?.validate(), false);
      expect(button.isActive, false);

      emailField.controller?.text = "ezgibati@gmail.com";
      await tester.pumpAndSettle();
      expect(formKey?.currentState?.validate(), true);
      button = tester.widget(buttonFinder) as ActionButton;
      expect(button.isActive, true);
    },
  );
  group("Tests network connection", () {
    late Dio dio;
    late DioAdapter dioAdapter;

    Response<dynamic> resp;
    const String baseUrl = NetworkConstants.baseUrl;
    const String route = '/auth/resend';

    final Map<String, dynamic> enteredInfo = <String, dynamic>{
      'email': 'ezgibati@gmail.com'
    };

    final Map<String, dynamic> invalidInfo = <String, dynamic>{
      'email': 'ezgibati@a.com'
    };

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(dio: dio);
    });

    test("verification code sent succesfully", () async {
      dioAdapter.onPost(
          route,
          (MockServer server) =>
              server.reply(200, null, delay: const Duration(seconds: 1)),
          data: enteredInfo);

      resp = await dio.post(route, data: enteredInfo);
      expect(resp.statusCode, 200);
    });

    test("Throws error when email does not exist", () async {
      dioAdapter.onPost(
        route,
        (MockServer server) => server.throws(
            500, DioError(requestOptions: RequestOptions(path: route))),
      );

      expect(
        () async => dio.post(route, data: invalidInfo),
        throwsA(isA<DioError>()),
      );
    });
  });
}
