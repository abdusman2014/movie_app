
import 'package:dartz/dartz.dart';

import '../../app/Config/errors.dart';

abstract class MovieRepository {
  Future<Either<List,FetchError>> fetchGenre();
}
