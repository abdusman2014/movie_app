import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Presentation/Controller/movie_controller.dart';

class WatchScreen extends StatelessWidget {
  WatchScreen({super.key});
  final movieController = Get.find<MovieController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        //elevation: 5,
        title: Text(
          "Watch",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: GestureDetector(
                  onTap: () async {
                   var data = await movieController.fetchGenre();
                    print('search: ' + data.toString());
                  },
                  child: const Icon(Icons.search))),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "data",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Text("data"),
          ],
        ),
      ),
    );
  }
}
