import 'package:dio/dio.dart';
import 'package:dio_filmes_app/application/dio/custom_dio.dart';
import 'package:dio_filmes_app/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  @override
  Future<Movies> findPopularMovies() async {
    try {
      final apiKey = dotenv.env['api_key'] ?? '';
      final dio = CustomDio();

      final result = await dio.get(
        'movie/popular',
        queryParameters: {
          'api_key': apiKey,
          'language': 'pt-br',
        },
      );

      return Movies.fromMap(result.data);
    } on DioError catch (e) {
      rethrow;
    }
  }

  @override
  Future<Movies> findTopRatedMovies() async {
    try {
      final dio = CustomDio();

      final result = await dio.get(
        'movie/top_rated',
      );
      debugPrint('Execução: ${result.data['execution_time']}');
      return Movies.fromMap(result.data);
    } on DioError catch (e) {
      rethrow;
    }
  }
}
