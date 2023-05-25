
import 'package:floor/floor.dart';

import '../../Domain/Model/movie.dart';
import '../../Domain/Model/movie_genre.dart';

const movieCollection = "movies";
const genreCollection = "genres";
const collectionBox = "CollectionBox";

@dao
abstract class MovieDao {
  @insert
  Future<List<int>> inserMovies(List<Movie> movies);

  @Query('SELECT * FROM Movie')
  Future<List<Movie>> retrieveMovies();

  @insert
  Future<List<int>> inserGenres(List<Genre> genres);

  @Query('SELECT * FROM Genre')
  Future<List<Genre>> retrieveGenre();

  // @Query('DELETE FROM User WHERE id = :id')
  // Future<User?> deleteUser(int id);
}