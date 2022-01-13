import 'dart:convert';

import 'package:dio_filmes_app/models/movie.dart';

class Movies {
  int page;
  int totalPages;
  List<Movie> results;

  Movies({
    required this.page,
    required this.totalPages,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'totalPages': totalPages,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      page: map['page']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
      results: List<Movie>.from(map['results']?.map((x) => Movie.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Movies.fromJson(String source) => Movies.fromMap(json.decode(source));
}
