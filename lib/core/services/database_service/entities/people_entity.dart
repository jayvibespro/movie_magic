import '../../../models/people_model/people_model.dart';

class PeopleEntity {
  static const String tableName = "people";

  /// Column names
  static const String columnAdult = "adult";
  static const String columnGender = "gender";
  static const String columnId = "id";
  static const String columnKnownForDepartment = "known_for_department";
  static const String columnName = "name";
  static const String columnOriginalName = "original_name";
  static const String columnAlsoKnownAs = "also_known_as";
  static const String columnBiography = "biography";
  static const String columnBirthday = "birthday";
  static const String columnPopularity = "popularity";
  static const String columnProfilePath = "profile_path";
  static const String columnPlaceOfBirth = "place_of_birth";

  final int adult;
  final int? gender;
  final int id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final String? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final double? popularity;
  final String? profilePath;
  final String? placeOfBirth;

  PeopleEntity({
    this.adult = 1,
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
  });

  /// Convert Model to Map for `sqflite`
  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnAdult: adult,
      columnName: name,
      columnGender: gender,
      columnKnownForDepartment: knownForDepartment,
      columnAlsoKnownAs: alsoKnownAs,
      columnOriginalName: originalName,
      columnBiography: biography,
      columnBirthday: birthday,
      columnPlaceOfBirth: placeOfBirth,
      columnPopularity: popularity,
      columnProfilePath: profilePath,
    };
  }

  /// Convert Map from `sqflite` to Model
  factory PeopleEntity.fromMap(Map<String, dynamic> map) {
    return PeopleEntity(
      id: map[columnId],
      name: map[columnName],
      gender: map[columnGender],
      originalName: map[columnOriginalName],
      popularity: map[columnPopularity],
      profilePath: map[columnProfilePath],
      knownForDepartment: map[columnKnownForDepartment],
      adult: map[columnAdult],
      alsoKnownAs: map[columnAlsoKnownAs],
      biography: map[columnBiography],
      birthday: map[columnBirthday],
      placeOfBirth: map[columnPlaceOfBirth],
    );
  }

  /// Convert `PeopleEntity` to `PeopleModel`
  PeopleModel toModel() {
    return PeopleModel(
      id: id,
      adult: adult == 1,
      name: name,
      gender: gender,
      knownForDepartment: knownForDepartment,
      alsoKnownAs: (alsoKnownAs ?? "").split(","),
      originalName: originalName,
      biography: biography,
      birthday: birthday,
      placeOfBirth: placeOfBirth,
      popularity: popularity,
      profilePath: profilePath,
      knownFor: [],
    );
  }

  /// Convert `PeopleModel` to `PeopleEntity`
  factory PeopleEntity.fromModel(PeopleModel model) {
    return PeopleEntity(
      id: model.id,
      adult: model.adult == true ? 1 : 0,
      name: model.name,
      gender: model.gender,
      knownForDepartment: model.knownForDepartment,
      alsoKnownAs: (model.alsoKnownAs ?? []).join(","),
      originalName: model.originalName,
      biography: model.biography,
      birthday: model.birthday,
      placeOfBirth: model.placeOfBirth,
      popularity: model.popularity,
      profilePath: model.profilePath,
    );
  }
}
