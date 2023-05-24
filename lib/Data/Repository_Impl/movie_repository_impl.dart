import 'package:movie_app/Data/Providers/Network/APIs/movie_api.dart';
import 'package:movie_app/Domain/Repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Map> fetchGenre() {
    return MovieApi().fetchGenre();
  }
}
