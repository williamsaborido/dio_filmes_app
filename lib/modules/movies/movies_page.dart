import 'package:dio_filmes_app/models/movie.dart';
import 'package:dio_filmes_app/modules/movies/movie_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movies_controller.dart';

class MoviesPage extends GetView<MoviesController> {
  final String _title = Get.arguments?.toString() ?? '';

  MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Obx(() {
                  return Text('Total de Filmes: ${controller.movies.length}');
                }),
              ),
              SizedBox(height: 20),
              Obx(() {
                return Wrap(
                  spacing: 10,
                  alignment: WrapAlignment.center,
                  children: controller.movies
                      .map<MovieCard>((movie) => MovieCard(movie: movie))
                      .toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
