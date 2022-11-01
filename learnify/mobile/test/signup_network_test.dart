import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:http_mock_adapter/src/handlers/request_handler.dart';
import 'package:learnify/core/constants/network_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  Response<dynamic> response;

  group('Tests various signup requests', () {
    const String baseUrl = NetworkConstants.localhostUrl;
    const String route = '/auth/signup';

    final Map<String, dynamic> userCredentials = <String, dynamic>{
      'email': 'bahrican@gmail.com',
      'password': 'Bahrican123${DateTime.now().toIso8601String()}',
      "username": "bahrican"
    };

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(dio: dio);
    });

    test('Successfully signs up the user', () async {
      dioAdapter.onPost(
        route,
        (MockServer server) =>
            server.reply(200, null, delay: const Duration(seconds: 1)),
        data: userCredentials,
      );

      response = await dio.post(route, data: userCredentials);
      expect(response.statusCode, 200);
    });

    test('Throws dio error when tried to sign up the same user', () async {
      dioAdapter.onPost(
        route,
        (MockServer server) => server.throws(
            409, DioError(requestOptions: RequestOptions(path: route))),
        data: userCredentials,
      );
      expect(
        () async => dio.post(route, data: userCredentials),
        throwsA(isA<DioError>()),
      );
    });

    test('Throws dio error when tried to sign up without body', () async {
      dioAdapter.onPost(
        route,
        (MockServer server) => server.throws(
            400, DioError(requestOptions: RequestOptions(path: route))),
      );
      expect(() async => dio.post(route), throwsA(isA<DioError>()));
    });

    test('Throws dio error when tried to sign up with missing body parameters',
        () async {
      dioAdapter.onPost(
        route,
        (MockServer server) => server.throws(
            400, DioError(requestOptions: RequestOptions(path: route))),
      );
      userCredentials.remove('username');
      expect(() async => dio.post(route, data: userCredentials),
          throwsA(isA<DioError>()));
    });
  });
}
