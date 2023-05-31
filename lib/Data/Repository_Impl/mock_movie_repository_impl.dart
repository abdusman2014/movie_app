import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Domain/Model/movie.dart';
import 'package:movie_app/Domain/Model/movie_genre.dart';
import 'package:movie_app/Domain/Repository/movie_repository.dart';
import 'package:movie_app/app/Config/errors.dart';
import 'package:movie_app/app/Services/floor_storage.dart';

import '../Providers/Network/APIs/movie_api.dart';

class MockMovieRespositoryImpl extends MovieRepository {
  @override
  Future<Either<List<Genre>, FetchError>> fetchGenre() async {
    final List<Genre> genres = [
      Genre(id: 1, name: "action"),
      Genre(id: 2, name: "horror"),
      Genre(id: 3, name: "adventure"),
      Genre(id: 4, name: "comedy"),
    ];
    return Left(genres);
  }

  @override
  Future<Either<List<Movie>, FetchError>> fetchMovies() async {
    final List<Movie> movies = [
      Movie(
          adult: true,
          backdropPath: "/znUYFf0Sez5lUmxPr3Cby7TVJ6c.jpg",
          genreIds: "[ 1, 2, 4]",
          id: 1,
          originalLanguage: "en",
          originalTitle: "The Little Mermaid",
          overview:
              "The youngest of King Triton’s daughters, and the most defiant, Ariel longs to find out more about the world beyond the sea, and while visiting the surface, falls for the dashing Prince Eric. With mermaids forbidden to interact with humans, Ariel makes a deal with the evil sea witch, Ursula, which gives her a chance to experience life on land, but ultimately places her life – and her father’s crown – in jeopardy.",
          popularity: 2224.581,
          posterPath: "/ym1dxyOk4jFcSl4Q2zmRrA5BEEN.jpg",
          releaseDate: "2023-05-18",
          title: "The Little Mermaid",
          video: false,
          voteAverage: 6.1,
          voteCount: 306),
           Movie(
          adult: true,
          backdropPath: "/znUYFf0Sez5lUmxPr3Cby7TVJ6c.png",
          genreIds: "[ 3,4 ]",
          id: 2,
          originalLanguage: "en",
          originalTitle: "The Little Mermaid 2",
          overview:
              "The youngest of King Triton’s daughters, and the most defiant, Ariel longs to find out more about the world beyond the sea, and while visiting the surface, falls for the dashing Prince Eric. With mermaids forbidden to interact with humans, Ariel makes a deal with the evil sea witch, Ursula, which gives her a chance to experience life on land, but ultimately places her life – and her father’s crown – in jeopardy.",
          popularity: 2224.581,
          posterPath: "/ym1dxyOk4jFcSl4Q2zmRrA5BEEN.jpg",
          releaseDate: "2023-05-18",
          title: "The Little Mermaid 2",
          video: false,
          voteAverage: 6.1,
          voteCount: 306),
    ];
    return Left(movies);
  }

  @override
  Future<Either<String, FetchError>> fetchVideo(int movieId) async {
    final String VideoId = "videoId";
    return Left(VideoId);
  }
}
