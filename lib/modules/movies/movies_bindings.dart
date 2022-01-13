import 'package:dio_filmes_app/application/rest_client/rest_client.dart';
import 'package:dio_filmes_app/application/rest_client/rest_client_dio.dart';
import 'package:dio_filmes_app/repositories/movies/movies_repository.dart';
import 'package:dio_filmes_app/repositories/movies/movies_repository_rest_client.dart';
import 'package:get/get.dart';
import './movies_controller.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClient>(() => RestClientDio());
    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryRestClient(restClient: Get.find()));
    Get.lazyPut(() => MoviesController(moviesRepository: Get.find()));
  }
}
