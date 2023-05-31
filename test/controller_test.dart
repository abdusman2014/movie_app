// Import the test package and Counter class

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:movie_app/Data/Repository_Impl/mock_movie_repository_impl.dart';
import 'package:movie_app/Domain/Model/movie.dart';
import 'package:movie_app/Domain/Model/movie_genre.dart';
import 'package:movie_app/Domain/Repository/movie_repository.dart';
import 'package:movie_app/Presentation/Controller/movie_controller.dart';
import 'package:dartz/dartz.dart';

void main() {
  Get.put<MovieRepository>(MockMovieRespositoryImpl());
  Get.put<MovieController>(MovieController());

  group('Movie Controller', () {
    final movieController = Get.find<MovieController>();
    movieController.fetchData();
    test('Test genre', () {
      final Genre expectedGenre = Genre(id: 1, name: "action");
      final Genre actualGenre = movieController.genres[0];
      expect(actualGenre.id, expectedGenre.id);
    });
    test('Test Movie', () {
      final Movie expectedMovie = Movie(
          adult: true,
          backdropPath: "/znUYFf0Sez5lUmxPr3Cby7TVJ6c.jpg",
          genreIds: "[ 12, 10751, 14, 10749 ]",
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
          voteCount: 306);
      final Movie actualMovie = movieController.movies[0];
      expect(actualMovie.id, expectedMovie.id);
    });
    test('Test genre Ids', () {
      final List<Genre> expectedGenres = [
        Genre(id: 1, name: "action"),
        Genre(id: 4, name: "comedy"),
      ];
      final List<Genre> actualGenres =
          movieController.getGenresNamebyIds([1, 4]);
      for (int i = 0; i < expectedGenres.length; ++i) {
        expect(actualGenres[i].id, expectedGenres[i].id);
      }
    });
    test('Test Movie Search', () {
      final Movie expectedMovie = Movie(
          adult: true,
          backdropPath: "/znUYFf0Sez5lUmxPr3Cby7TVJ6c.jpg",
          genreIds: "[ 12, 10751, 14, 10749 ]",
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
          voteCount: 306);
      final List<Movie> actualMovie =
          movieController.searchMovies("The");
     // print(actualMovie);
       expect(actualMovie[0].id, expectedMovie.id);
    });
    test('Test genre Images', () {
      final List<Tuple2<String, String>> expectedGenreImages = [
        const Tuple2("/znUYFf0Sez5lUmxPr3Cby7TVJ6c.jpg", "action"),
        const Tuple2("/znUYFf0Sez5lUmxPr3Cby7TVJ6c.jpg", "horror"),
        const Tuple2("/znUYFf0Sez5lUmxPr3Cby7TVJ6c.png", "adventure"),
        const Tuple2("/znUYFf0Sez5lUmxPr3Cby7TVJ6c.jpg", "comedy"),
      ];
      final List<Tuple2<String, String>> actualGenreImages =
          movieController.getImageOfEachGenre();
      for (int i = 0; i < expectedGenreImages.length; ++i) {
        //compare image paths with expected image paths
        expect(actualGenreImages[i].value1, expectedGenreImages[i].value1);
        //compare genre name with expected genre name
        expect(actualGenreImages[i].value2, expectedGenreImages[i].value2);
      }
    });
  });
}
