import '../../../models/profile_model/profile_model.dart';

class ProfileEntity {
  static const String tableName = 'profiles';
  static const String columnFilePath = 'file_path';
  static const String columnAspectRatio = 'aspect_ratio';
  static const String columnHeight = 'height';
  static const String columnIso6391 = 'iso_639_1';
  static const String columnVoteAverage = 'vote_average';
  static const String columnVoteCount = 'vote_count';
  static const String columnWidth = 'width';
  static const String columnActorId = 'actor_id';

  final String? filePath;
  final double? aspectRatio;
  final int? height;
  final String? iso6391;
  final double? voteAverage;
  final int? voteCount;
  final int? width;
  int? actorId;

  ProfileEntity({
    required this.filePath,
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width,
    this.actorId,
  });

  /// Convert ProfileEntity to ProfileModel
  ProfileModel toModel() {
    return ProfileModel(
      filePath: filePath,
      aspectRatio: aspectRatio,
      height: height,
      iso6391: iso6391,
      voteAverage: voteAverage,
      voteCount: voteCount,
      width: width,
    );
  }

  /// Convert ProfileModel to ProfileEntity
  factory ProfileEntity.fromModel(ProfileModel model) {
    return ProfileEntity(
      filePath: model.filePath,
      aspectRatio: model.aspectRatio,
      height: model.height,
      iso6391: model.iso6391,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      width: model.width,
    );
  }

  /// Convert entity to a Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      columnFilePath: filePath,
      columnAspectRatio: aspectRatio,
      columnHeight: height,
      columnIso6391: iso6391,
      columnVoteAverage: voteAverage,
      columnVoteCount: voteCount,
      columnWidth: width,
      columnActorId: actorId,
    };
  }

  /// Convert Map (from SQLite) to ProfileEntity
  factory ProfileEntity.fromMap(Map<String, dynamic> map) {
    return ProfileEntity(
      filePath: map[columnFilePath],
      aspectRatio: map[columnAspectRatio],
      height: map[columnHeight],
      iso6391: map[columnIso6391],
      voteAverage: map[columnVoteAverage],
      voteCount: map[columnVoteCount],
      width: map[columnWidth],
    );
  }
}
