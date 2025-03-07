import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetailsModel {
  final bool adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "belongs_to_collection")
  final Collection? belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int id;
  @JsonKey(name: "imdb_id")
  final String? imdbId;
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "production_companies")
  final List<ProductionCompany>? productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountry>? productionCountries;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguage> spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;

  MovieDetailsModel({
    this.adult = false,
    required this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    this.video = false,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}

@JsonSerializable()
class Collection {
  final int id;
  final String? name;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;

  Collection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}

@JsonSerializable()
class Genre {
  final int id;
  final String? name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  final int id;
  @JsonKey(name: "logo_path")
  final String? logoPath;
  final String? name;
  @JsonKey(name: "origin_country")
  final String? originCountry;

  ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  @JsonKey(name: "iso_3166_1")
  final String? iso31661;
  final String? name;

  ProductionCountry({required this.iso31661, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  @JsonKey(name: "english_name")
  final String? englishName;
  @JsonKey(name: "iso_639_1")
  final String? iso6391;
  final String? name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
