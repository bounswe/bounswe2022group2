import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:http_mock_adapter/src/handlers/request_handler.dart';
import 'package:learnify/core/constants/network_constants.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/core/widgets/text-field/custom_text_form_field.dart';
import 'package:learnify/core/widgets/text-field/obscured_text_form_field.dart';
import 'package:learnify/features/auth/login/constants/widget_keys.dart';
import 'package:learnify/features/auth/login/view/login_screen.dart';

import 'test_helpers.dart';

void main() {
  testWidgets(
    "Test login screen",
    (WidgetTester tester) async {
      const LoginScreen loginScreen = LoginScreen();
      await tester.pumpWidget(TestHelpers.appWidget(loginScreen));

      final Finder buttonFinder = find.byType(ActionButton);
      expect(buttonFinder, findsOneWidget);
      ActionButton actionButton = tester.widget(buttonFinder) as ActionButton;

      final Finder formFinder = find.byType(Form);
      expect(formFinder, findsOneWidget);
      final Form form = tester.widget(formFinder) as Form;

      final GlobalKey<FormState>? formKey = form.key as GlobalKey<FormState>?;
      expect(actionButton.isActive, false);
      expect(formKey?.currentState?.validate(), false);

      final Finder emailFinder = find.byKey(LoginKeys.emailField);
      expect(emailFinder, findsOneWidget);
      final CustomTextFormField emailField =
          tester.widget(emailFinder) as CustomTextFormField;

      final Finder passwordFinder = find.byKey(LoginKeys.passwordField);
      expect(passwordFinder, findsOneWidget);
      final ObscuredTextFormField passwordField =
          tester.widget(passwordFinder) as ObscuredTextFormField;

      emailField.controller?.text = 'onur@gmail.com';
      passwordField.controller.text = 'onur';
      await tester.pumpAndSettle();
      expect(formKey?.currentState?.validate(), false);

      emailField.controller?.text = 'onur@gmail.com';
      passwordField.controller.text = 'Password123';
      await tester.pumpAndSettle();
      expect(formKey?.currentState?.validate(), true);
      actionButton = tester.widget(buttonFinder) as ActionButton;
      expect(actionButton.isActive, true);

      actionButton = tester.widget(buttonFinder) as ActionButton;
      expect(actionButton.isActive, true);
    },
  );

  group("Tests login network connection ->", () {
    late Dio dio;
    late DioAdapter dioAdapter;

    Response<dynamic> resp;
    const String baseUrl = NetworkConstants.localhostUrl;
    const String route = '/auth/login';

    final Map<String, dynamic> correctLogin = <String, dynamic>{
      'email': 'onur@gmail.com',
      'password': 'Password123'
    };

    final Map<String, dynamic> incorrectLogin = <String, dynamic>{
      'email': 'onur@gmail.com',
      'password': 'Password12${DateTime.now().toIso8601String()}'
    };

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(dio: dio);
    });

    test("Login is succesful", () async {
      dioAdapter.onPost(
          route,
          (MockServer server) =>
              server.reply(200, null, delay: const Duration(seconds: 1)),
          data: correctLogin);

      resp = await dio.post(route, data: correctLogin);
      expect(resp.statusCode, 200);
    });

    test("Login is unsuccesful", () async {
      dioAdapter.onPost(
        route,
        (MockServer server) => server.throws(
            400, DioError(requestOptions: RequestOptions(path: route))),
      );

      expect(
        () async => dio.post(route, data: incorrectLogin),
        throwsA(isA<DioError>()),
      );
    });
  });
}
