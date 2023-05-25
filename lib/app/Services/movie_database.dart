import 'dart:async';

import 'package:floor/floor.dart';
import 'package:movie_app/Domain/Model/movie.dart';
import 'package:movie_app/Domain/Model/movie_genre.dart';
import 'package:movie_app/app/Services/movie_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

 part 'movie_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Movie,Genre])
abstract class MovieDatabase extends FloorDatabase {
   MovieDao get movieDao;
}