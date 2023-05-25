import 'package:movie_app/Domain/Model/movie_genre.dart';

import '../../Domain/Model/movie.dart';
import 'movie_database.dart';

class FloorStorage {
  static late MovieDatabase _movieDatabase;
  //static late GenreDatabase _genreDatabase;

  static Future<void> initDatabase() async {
    final movieValue =
        await $FloorMovieDatabase.databaseBuilder('movie_database.db').build();
    // final genreValue =
    //     await $FloorGenreDatabase.databaseBuilder('genre.db').build();
    _movieDatabase = movieValue;
    // _genreDatabase = genreValue;
  }

  static Future<void> saveMoviesToCache(List<Movie> movies) async {
    await _movieDatabase.movieDao.inserMovies(movies);
  }

  static Future<List<Movie>> fetchMoviesFromCache() async {
    return await _movieDatabase.movieDao.retrieveMovies();
  }

  static Future<void> saveGenresToCache(List<Genre> genres) async {
    await _movieDatabase.movieDao.inserGenres(genres);
  }

  static Future<List<Genre>> fetchGenresFromCache() async {
    return await _movieDatabase.movieDao.retrieveGenre();
  }
}
