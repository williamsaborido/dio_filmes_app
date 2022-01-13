import 'package:dio_filmes_app/application/rest_client/rest_client_response.dart';

abstract class RestClient {
  RestClient auth();
  Future<RestClientResponse<T>> post<T>(String path,
      {required dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers});
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
