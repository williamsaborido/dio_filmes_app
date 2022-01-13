import 'package:dio_filmes_app/models/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterImageUrl}',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 150),
            child:
                Text(movie.title, style: Theme.of(context).textTheme.subtitle2),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 150),
            child: Text(movie.overview,
                style: Theme.of(context).textTheme.bodyText2),
          ),
        ],
      ),
    );
  }
}
