import '../../../models/movie_model/movie_model.dart';

class MovieEntity {
  static const String tableName = "movies";

  static const String columnId = "id";
  static const String columnBackdropPath = "backdrop_path";
  static const String columnTitle = "title";
  static const String columnOriginalTitle = "original_title";
  static const String columnOverview = "overview";
  static const String columnPosterPath = "poster_path";
  static const String columnMediaType = "media_type";
  static const String columnAdult = "adult";
  static const String columnOriginalLanguage = "original_language";
  static const String columnGenreIds = "genre_ids";
  static const String columnPopularity = "popularity";
  static const String columnReleaseDate = "release_date";
  static const String columnVideo = "video";
  static const String columnVoteAverage = "vote_average";
  static const String columnVoteCount = "vote_count";
  static const String columnSection = "section";

  final int id;
  final String? backdropPath;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final bool adult;
  final String? originalLanguage;
  final List<int> genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool video;
  final double? voteAverage;
  final int? voteCount;
  String? section;

  MovieEntity({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.section,
  });

  // Convert MovieEntity to Map (for inserting into the database)
  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnBackdropPath: backdropPath,
      columnTitle: title,
      columnOriginalTitle: originalTitle,
      columnOverview: overview,
      columnPosterPath: posterPath,
      columnMediaType: mediaType,
      columnAdult: adult ? 1 : 0,
      columnOriginalLanguage: originalLanguage,
      columnGenreIds: genreIds.join(","), // Convert List<int> to String
      columnPopularity: popularity,
      columnReleaseDate: releaseDate,
      columnVideo: video ? 1 : 0,
      columnVoteAverage: voteAverage,
      columnVoteCount: voteCount,
      columnSection: section,
    };
  }

  // Convert Map to MovieEntity (for retrieving from the database)
  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: map[columnId] as int,
      backdropPath: map[columnBackdropPath] as String?,
      title: map[columnTitle] as String?,
      originalTitle: map[columnOriginalTitle] as String?,
      overview: map[columnOverview] as String?,
      posterPath: map[columnPosterPath] as String?,
      mediaType: map[columnMediaType] as String?,
      adult: (map[columnAdult] as int) == 1,
      originalLanguage: map[columnOriginalLanguage] as String?,
      genreIds:
          (map[columnGenreIds] as String)
              .split(",")
              .where((e) => e.isNotEmpty)
              .map((e) => int.parse(e))
              .toList(),
      popularity: (map[columnPopularity] as num?)?.toDouble(),
      releaseDate: map[columnReleaseDate] as String?,
      video: (map[columnVideo] as int) == 1,
      voteAverage: (map[columnVoteAverage] as num?)?.toDouble(),
      voteCount: map[columnVoteCount] as int?,
    );
  }

  // Convert MovieEntity to MovieModel
  MovieModel toModel() {
    return MovieModel(
      id: id,
      backdropPath: backdropPath,
      title: title,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath,
      mediaType: mediaType,
      adult: adult,
      originalLanguage: originalLanguage,
      genreIds: genreIds,
      popularity: popularity,
      releaseDate: releaseDate,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  // Convert MovieModel to MovieEntity
  factory MovieEntity.fromModel(MovieModel model) {
    return MovieEntity(
      id: model.id,
      backdropPath: model.backdropPath,
      title: model.title,
      originalTitle: model.originalTitle,
      overview: model.overview,
      posterPath: model.posterPath,
      mediaType: model.mediaType,
      adult: model.adult,
      originalLanguage: model.originalLanguage,
      genreIds: model.genreIds,
      popularity: model.popularity,
      releaseDate: model.releaseDate,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }
}
