import 'package:dio/dio.dart';

class HttpClientConfig {
  HttpClientConfig();

  Dio get dio => _getDio();

  Dio _getDio() {
    final options = BaseOptions(
      baseUrl: 'https://7780-182-253-56-90.ngrok-free.app/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final dio = Dio(options);

    return dio;
  }
}
