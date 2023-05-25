import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Domain/Model/movie.dart';
import 'package:movie_app/Domain/Model/movie_genre.dart';
import 'package:movie_app/Domain/Repository/movie_repository.dart';
import 'package:movie_app/app/Config/errors.dart';

import '../Providers/Network/APIs/movie_api.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either<List<Genre>, FetchError>> fetchGenre() async {
    final Either<Response<Map<String, dynamic>>, FetchError> res =
        await MovieApi().fetchGenre();
    return res.fold((response) {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data!;
        List<Genre> genres = [];
        for (Map<String, dynamic> e in data["genres"]) {
          genres.add(Genre.fromJson(e));
        }
        return Left(genres);
      } else {
        return const Right(FetchError.unknownError());
      }
    }, (error) => Right(error));
  }

  @override
  Future<Either<List<Movie>, FetchError>> fetchMovies() async {
    final Either<Response<Map<String, dynamic>>, FetchError> res =
        await MovieApi().fetchMovies();
    return res.fold((response) {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data!;
        List<Movie> genres = [];
        for (Map<String, dynamic> e in data["results"]) {
          genres.add(Movie.fromJson(e));
        }
        return Left(genres);
      } else {
        return const Right(FetchError.unknownError());
      }
    }, (error) => Right(error));
  }

  @override
  Future<Either<String, FetchError>> fetchVideo(int movieId) async {
    final Either<Response<Map<String, dynamic>>, FetchError> res =
        await MovieApi().fetchVideo(movieId);
    return res.fold((response) {
      if (response.statusCode == 200) {
        final String data = response.data!["results"][0]["key"];

        return Left(data);
      } else {
        return const Right(FetchError.unknownError());
      }
    }, (error) => Right(error));
  }
}
