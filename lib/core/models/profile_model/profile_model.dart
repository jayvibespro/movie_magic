import 'package:daladala/core/services/database_service/entities/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: 'aspect_ratio')
  final double? aspectRatio;

  final int? height;

  @JsonKey(name: 'iso_639_1')
  final String? iso6391;

  @JsonKey(name: 'file_path')
  final String? filePath;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  final int? width;

  ProfileModel({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  // Factory method to generate an instance from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  // Method to generate JSON from the model
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  /// Convert `ProfileModel` to `ProfileEntity`
  ProfileEntity toEntity() {
    return ProfileEntity(
      filePath: filePath,
      aspectRatio: aspectRatio,
      height: height,
      iso6391: iso6391,
      voteAverage: voteAverage,
      voteCount: voteCount,
      width: width,
    );
  }
}
