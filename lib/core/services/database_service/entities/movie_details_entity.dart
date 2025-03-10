import '../../../models/movie_details_model/movie_details_model.dart';

class MovieDetailsEntity {
  static const String tableName = 'movie_details';

  static const String columnAdult = 'adult';
  static const String columnBackdropPath = 'backdrop_path';
  static const String columnBelongsToCollection = 'belongs_to_collection';
  static const String columnBudget = 'budget';
  static const String columnGenres = 'genres';
  static const String columnHomepage = 'homepage';
  static const String columnId = 'id';
  static const String columnImdbId = 'imdb_id';
  static const String columnOriginCountry = 'origin_country';
  static const String columnOriginalLanguage = 'original_language';
  static const String columnOriginalTitle = 'original_title';
  static const String columnOverview = 'overview';
  static const String columnPopularity = 'popularity';
  static const String columnPosterPath = 'poster_path';
  static const String columnProductionCompanies = 'production_companies';
  static const String columnProductionCountries = 'production_countries';
  static const String columnReleaseDate = 'release_date';
  static const String columnRevenue = 'revenue';
  static const String columnRuntime = 'runtime';
  static const String columnSpokenLanguages = 'spoken_languages';
  static const String columnStatus = 'status';
  static const String columnTagline = 'tagline';
  static const String columnTitle = 'title';
  static const String columnVideo = 'video';
  static const String columnVoteAverage = 'vote_average';
  static const String columnVoteCount = 'vote_count';

  final bool adult;
  final String? backdropPath;
  final String? belongsToCollection;
  final int? budget;
  final String? genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? productionCompanies;
  final String? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool video;
  final double? voteAverage;
  final int? voteCount;

  MovieDetailsEntity({
    this.adult = false,
    required this.backdropPath,
    required this.belongsToCollection,
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

  Map<String, dynamic> toMap() {
    return {
      columnAdult: adult ? 1 : 0,
      columnBackdropPath: backdropPath,
      columnBelongsToCollection: belongsToCollection,
      columnBudget: budget,
      columnGenres: genres,
      columnHomepage: homepage,
      columnId: id,
      columnImdbId: imdbId,
      columnOriginCountry: originCountry,
      columnOriginalLanguage: originalLanguage,
      columnOriginalTitle: originalTitle,
      columnOverview: overview,
      columnPopularity: popularity,
      columnPosterPath: posterPath,
      columnProductionCompanies: productionCompanies,
      columnProductionCountries: productionCountries,
      columnReleaseDate: releaseDate,
      columnRevenue: revenue,
      columnRuntime: runtime,
      columnSpokenLanguages: spokenLanguages,
      columnStatus: status,
      columnTagline: tagline,
      columnTitle: title,
      columnVideo: video ? 1 : 0,
      columnVoteAverage: voteAverage,
      columnVoteCount: voteCount,
    };
  }

  factory MovieDetailsEntity.fromMap(Map<String, dynamic> map) {
    return MovieDetailsEntity(
      adult: map[columnAdult] == 1,
      backdropPath: map[columnBackdropPath],
      belongsToCollection: map[columnBelongsToCollection],
      budget: map[columnBudget],
      genres: map[columnGenres],
      homepage: map[columnHomepage],
      id: map[columnId],
      imdbId: map[columnImdbId],
      originCountry: map[columnOriginCountry],
      originalLanguage: map[columnOriginalLanguage],
      originalTitle: map[columnOriginalTitle],
      overview: map[columnOverview],
      popularity: map[columnPopularity],
      posterPath: map[columnPosterPath],
      productionCompanies: map[columnProductionCompanies],
      productionCountries: map[columnProductionCountries],
      releaseDate: map[columnReleaseDate],
      revenue: map[columnRevenue],
      runtime: map[columnRuntime],
      spokenLanguages: map[columnSpokenLanguages],
      status: map[columnStatus],
      tagline: map[columnTagline],
      title: map[columnTitle],
      video: map[columnVideo] == 1,
      voteAverage: map[columnVoteAverage],
      voteCount: map[columnVoteCount],
    );
  }

  MovieDetailsModel toModel() {
    return MovieDetailsModel(
      adult: adult,
      backdropPath: backdropPath,
      belongsToCollection: null,
      budget: budget,
      genres: [],
      homepage: homepage,
      id: id,
      imdbId: imdbId,
      originCountry: [],
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      productionCompanies: [],
      productionCountries: [],
      releaseDate: releaseDate,
      revenue: revenue,
      runtime: runtime,
      spokenLanguages: [],
      status: status,
      tagline: tagline,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  factory MovieDetailsEntity.fromModel(MovieDetailsModel model) {
    return MovieDetailsEntity(
      adult: model.adult,
      backdropPath: model.backdropPath,
      belongsToCollection: null,
      budget: model.budget,
      genres: null,
      homepage: model.homepage,
      id: model.id,
      imdbId: model.imdbId,
      originCountry: null,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: model.posterPath,
      productionCompanies: null,
      productionCountries: null,
      releaseDate: model.releaseDate,
      revenue: model.revenue,
      runtime: model.runtime,
      spokenLanguages: null,
      status: model.status,
      tagline: model.tagline,
      title: model.title,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }
}
