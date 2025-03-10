import 'package:json_annotation/json_annotation.dart';

import '../../../models/movie_details_model/movie_details_model.dart';

class GenreEntity {
  static const String tableName = 'genres';

  // Column names for database
  static const String columnId = 'id';
  static const String columnName = 'name';

  final int id;

  final String? name;

  GenreEntity({required this.id, required this.name});

  /// Convert Model to Map for `sqflite`
  Map<String, dynamic> toMap() {
    return {columnId: id, columnName: name};
  }

  /// Convert Map from `sqflite` to Model
  factory GenreEntity.fromMap(Map<String, dynamic> map) {
    return GenreEntity(id: map[columnId], name: map[columnName]);
  }

  /// Convert `GenreEntity` to `GenreModel`
  GenreModel toModel() {
    return GenreModel(id: id, name: name);
  }

  /// Convert `GenreModel` to `GenreEntity`
  factory GenreEntity.fromModel(GenreModel model) {
    return GenreEntity(id: model.id, name: model.name);
  }
}
