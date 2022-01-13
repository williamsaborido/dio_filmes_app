import 'package:dio/dio.dart';
import 'package:dio_filmes_app/application/dio/custom_dio_auth_interceptor.dart';
import 'package:dio_filmes_app/application/dio/custom_dio_time_execution_interceptor.dart';

import 'package:dio_filmes_app/application/rest_client/rest_client.dart';
import 'package:dio_filmes_app/application/rest_client/rest_client_exception.dart';
import 'package:dio_filmes_app/application/rest_client/rest_client_response.dart';

class RestClientDio implements RestClient {
  late Dio _dio;

  static final _baseOptions = BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    connectTimeout: 6000,
    receiveTimeout: 6000,
  );

  RestClientDio() {
    _dio = Dio(_baseOptions);
    _dio.interceptors.addAll([
      CustomDioTimeExecutionInterceptor(),
      CustomDioAuthInterceptor(),
    ]);
  }

  @override
  RestClient auth() {
    _baseOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  patch() {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));

      return RestClientResponse(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return RestClientResponse(
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage);
    } on DioError catch (e) {
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
      );
    }
  }

  @override
  put() {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  request() {
    // TODO: implement request
    throw UnimplementedError();
  }
}
