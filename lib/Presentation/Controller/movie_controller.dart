import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:movie_app/Domain/Model/movie_genre.dart';
import 'package:movie_app/Domain/Repository/movie_repository.dart';

import '../../app/Config/errors.dart';

class MovieController extends GetxController {
  final movieRepo = Get.find<MovieRepository>();
  Future<void> fetchGenre() async {
    Either<List<Genre>, FetchError> data =
        await movieRepo.fetchGenre() as Either<List<Genre>, FetchError>;

    data.fold((genres) {
      print('controller: ' + genres[1].name);
    }, (error) {
      
    });
  }
}
