import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';


part 'movie.g.dart';

@entity
@JsonSerializable()
class Movie {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'genre_ids')
  //actual type is List<int> but list can not be stored in floor database
  //thats why storing this as json encoded string and decoding it back to List where needed
  //the correct approch would be foriegn key approch but due to time shortage not able to implement it
  String genreIds;
  @PrimaryKey()
  int id;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  String title;
  bool video;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  double voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
