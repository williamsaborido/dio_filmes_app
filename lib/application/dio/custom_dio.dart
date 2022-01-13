import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dio_filmes_app/application/dio/custom_dio_auth_interceptor.dart';
import 'package:dio_filmes_app/application/dio/custom_dio_time_execution_interceptor.dart';

class CustomDio extends DioForNative {
  static final _baseOptions = BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    connectTimeout: 6000,
    receiveTimeout: 6000,
  );

  CustomDio() : super(_baseOptions) {
    interceptors.addAll([
      CustomDioTimeExecutionInterceptor(),
      CustomDioAuthInterceptor(),
    ]);
  }
}
