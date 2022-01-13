import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomDioAuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiKey = dotenv.env['api_key'] ?? '';

    final queryParameters = {
      'api_key': apiKey,
      'language': 'pt-br',
    };

    options.queryParameters.addAll(queryParameters);

    handler.next(options);
  }
}
