import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:movie_app/Domain/Model/movie.dart';
import 'package:movie_app/Domain/Model/movie_genre.dart';
import 'package:movie_app/Domain/Repository/movie_repository.dart';

import '../../app/Config/errors.dart';

class MovieController extends GetxController {
  final genres = RxList<Genre>();
  final movies = RxList<Movie>();
  final _movieRepo = Get.find<MovieRepository>();
  Future<Either<None, FetchError>> _fetchGenre() async {
    Either<List<Genre>, FetchError> data =
        await _movieRepo.fetchGenre() as Either<List<Genre>, FetchError>;
    //genres.value = data;
    return data.fold((genresVal) {
      genres.value = genresVal;

      return const Left(None());
    }, (error) {
      return Right(error);
    });
  }

  Future<Either<None, FetchError>> _fetchMovies() async {
    Either<List<Movie>, FetchError> data =
        await _movieRepo.fetchMovies() as Either<List<Movie>, FetchError>;
    //genres.value = data;
    return data.fold((moviesVal) {
      movies.value = moviesVal;

      return const Left(None());
    }, (error) {
      return Right(error);
    });
  }

  Future<Either<None, FetchError>> fetchData() async {
    final Either<None, FetchError> moviesResponse = await _fetchMovies();

    return moviesResponse.fold((none) async {
      final Either<None, FetchError> generesResponse = await _fetchGenre();
      return generesResponse.fold((none) async {
        return const Left(None());
      }, (error) {
        return Right(error);
      });
    }, (error) {
      return Right(error);
    });
  }

  List<Genre> getGenresNamebyIds(List<dynamic> genreIds) {
    //filtering all the genres have desired genreId
    return genres.where((element) {
      return genreIds.contains(element.id);
    }).toList();
  }

  List<Tuple2<String, String>> getImageOfEachGenre() {
    //filtering all the genres have desired genreId
    // return movies.where((element) {
    //   return genres.contains(element.genreIds);
    // }).toList();
    List<Tuple2<String, String>> genreMovies = [];

    for (Genre genre in genres) {
      Movie? res = movies.firstWhere(
        (element) => jsonDecode(element.genreIds).contains(genre.id),
        orElse: () {
          //dummy movie created that is only returned if that specific genre has no movies
          return Movie(
              adult: false,
              backdropPath: "backdropPath",
              genreIds: "[1]",
              id: -1,
              originalLanguage: "originalLanguage",
              originalTitle: "originalTitle",
              overview: "overview",
              popularity: 1,
              posterPath: "posterPath",
              releaseDate: "releaseDate",
              title: "title",
              video: false,
              voteAverage: 1,
              voteCount: 1);
        },
      );
      //donot add dummy movie to the list
      if (res.id != -1) {
        genreMovies.add(Tuple2<String, String>(res.backdropPath, genre.name));
      }
    }
    // List<Tuple2<String, String>> images = [];
    // for (Movie movie in genreMovies) {
    //   images.add(Tuple2<String, String>(movie.backdropPath, movie.title));
    // }

    return genreMovies;
  }

  List<Movie> searchMovies(String text) {
    return movies.where((element) =>
       element.title.toLowerCase().contains(text.toLowerCase())
    ).toList();
  }

  Future<Either<String, FetchError>> fetchVideo(int movieId) async {
    final Either<String, FetchError> res = await _movieRepo.fetchVideo(movieId);
    return res.fold((video) {
      return Left(video);
    }, (error) {
      return Right(error);
    });
  }
}
