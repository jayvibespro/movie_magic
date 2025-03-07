import 'package:json_annotation/json_annotation.dart';

import '../movie_details_model/movie_details_model.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  final int id;

  final String? title;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  final String? overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'media_type')
  final String? mediaType;

  final bool adult;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;

  final double? popularity;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  final bool video;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  List<Genre>? genres;

  MovieModel({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    this.adult = false,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    this.video = false,
    required this.voteAverage,
    required this.voteCount,
    this.genres,
  });

  // From JSON
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
