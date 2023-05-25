
import 'package:dartz/dartz.dart';

import '../../app/Config/errors.dart';

abstract class MovieRepository {
  Future<Either<List,FetchError>> fetchGenre();
  Future<Either<List,FetchError>> fetchMovies();
  Future<Either<String,FetchError>> fetchVideo(int movieId);
}
