import 'package:get/get.dart';
import 'package:movie_app/Domain/Repository/movie_repository.dart';

class MovieController extends GetxController {
  final movieRepo = Get.find<MovieRepository>();
  Future<Map<dynamic, dynamic>> fetchGenre() {
    return movieRepo.fetchGenre();
  }
}
