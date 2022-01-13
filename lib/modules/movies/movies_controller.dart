import 'package:dio_filmes_app/models/movie.dart';
import 'package:get/get.dart';

import 'package:dio_filmes_app/repositories/movies/movies_repository.dart';

class MoviesController extends GetxController {
  final MoviesRepository _moviesRepository;

  final String type = Get.arguments;
  final _movies = <Movie>[].obs;
  final _loading = false.obs;

  List<Movie> get movies => _movies;

  bool get loading => _loading.value;

  MoviesController({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  Future findPopularMovies() async {
    _loading.toggle();
    var result = await _moviesRepository.findPopularMovies();
    _movies.assignAll(result.results);
    _loading.toggle();
  }

  Future findTopRatedMovies() async {
    _loading.toggle();
    var result = await _moviesRepository.findTopRatedMovies();
    _movies.assignAll(result.results);
    _loading.toggle();
  }

  Future findMovies() async {
    if (type == 'populares') {
      await findPopularMovies();
    } else {
      await findTopRatedMovies();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    findMovies();
  }
}
