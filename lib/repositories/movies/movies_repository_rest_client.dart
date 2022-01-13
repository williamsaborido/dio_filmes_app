import 'package:dio_filmes_app/application/rest_client/rest_client.dart';
import 'package:dio_filmes_app/application/rest_client/rest_client_exception.dart';
import 'package:dio_filmes_app/models/movies.dart';
import 'package:dio_filmes_app/repositories/movies/movies_repository.dart';

class MoviesRepositoryRestClient implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryRestClient({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<Movies> findPopularMovies() async {
    try {
      final result = await _restClient.get('movie/popular');

      return Movies.fromMap(result.data);
    } on RestClientException catch (e) {
      rethrow;
    }
  }

  @override
  Future<Movies> findTopRatedMovies() async {
    try {
      final result = await _restClient.get('movie/top_rated');
      return Movies.fromMap(result.data);
    } on RestClientException catch (e) {
      rethrow;
    }
  }
}
