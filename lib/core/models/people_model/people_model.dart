import 'package:daladala/core/models/movie_model/movie_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people_model.g.dart';

@JsonSerializable()
class PeopleModel {
  final bool adult;
  final int? gender;
  final int id;
  @JsonKey(name: "known_for_department")
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  final double? popularity;
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @JsonKey(name: "known_for")
  final List<MovieModel>? knownFor;

  PeopleModel({
    this.adult = false,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.knownFor,
  });

  // Factory method to convert JSON to PeopleModel
  factory PeopleModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleModelFromJson(json);

  // Method to convert PeopleModel to JSON
  Map<String, dynamic> toJson() => _$PeopleModelToJson(this);
}
