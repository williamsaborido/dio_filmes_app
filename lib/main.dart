import 'package:dio_filmes_app/modules/home/home_bindings.dart';
import 'package:dio_filmes_app/modules/home/home_page.dart';
import 'package:dio_filmes_app/modules/movies/movies_bindings.dart';
import 'package:dio_filmes_app/modules/movies/movies_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: '/movies',
          page: () => MoviesPage(),
          binding: MoviesBindings(),
        ),
      ],
    );
  }
}
