import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../app/Config/errors.dart';
import '../../Controller/movie_controller.dart';
import 'home.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final movieController = Get.find<MovieController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Either<None, FetchError>>(
          future: movieController.fetchData(),
          builder: (BuildContext context,
              AsyncSnapshot<Either<None, FetchError>> snapshot) {
            if (snapshot.hasData) {
              final Either<None, FetchError> result =
                  snapshot.data as Either<None, FetchError>;
              return result.fold((none) {
                return const MyHome();
              }, (error) {
                if (error == const FetchError.networkError()) {
                  return Center(
                    child: Text(
                      "Network Error!",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Unknown Error!",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  );
                }
              });
            }
            return Center(
              child: Lottie.asset('assets/animations/loading.json'),
            );
          }),
    );
  }
}
