import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_genre.g.dart';

@entity
@JsonSerializable()
class Genre {
  @PrimaryKey()
  int id;
  String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
