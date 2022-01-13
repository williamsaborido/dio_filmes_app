import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton.icon(
              onPressed: () => Get.toNamed('/movies', arguments: 'populares'),
              label: const Text('Populares'),
              icon: const Icon(Icons.people_alt_outlined),
            ),
            ElevatedButton.icon(
              onPressed: () => Get.toNamed('/movies', arguments: 'maisVotados'),
              label: const Text('Mais votados'),
              icon: const Icon(Icons.people_alt_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
