import 'package:dio/dio.dart';

class HttpClientConfig {
  HttpClientConfig();

  Dio get dio => _getDio();

  Dio _getDio() {
    final options = BaseOptions(
      baseUrl: 'http://192.168.0.152:3000/',
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
