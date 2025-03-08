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
  @JsonKey(name: "also_known_as")
  final List<String>? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final double? popularity;
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @JsonKey(name: "place_of_birth")
  final String? placeOfBirth;
  @JsonKey(name: "known_for")
  final List<MovieModel>? knownFor;

  PeopleModel({
    this.adult = false,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    this.alsoKnownAs,
    required this.originalName,
    this.biography,
    this.birthday,
    this.placeOfBirth,
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
