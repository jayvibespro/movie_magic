import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/movie_details_model/movie_details_model.dart';
import 'entities/genre_entity.dart';

class GenreTableService {
  final Database _database;

  GenreTableService(this._database);

  Future<void> createGenreTable() async {
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS ${GenreEntity.tableName} (
        ${GenreEntity.columnId} INTEGER PRIMARY KEY,
        ${GenreEntity.columnName} TEXT
      )
    ''');
  }

  Future<bool> insertGenres(List<GenreModel> genres) async {
    try {
      final batch = _database.batch();

      for (var genre in genres) {
        batch.insert(
          GenreEntity.tableName,
          genre.toEntity().toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit(
        noResult: true,
      ); // Executes all inserts in a single transaction
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("INSERT GENRE ERROR: $e");
      }
      return false;
    }
  }

  Future<List<GenreModel>> getGenres() async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query(
        GenreEntity.tableName,
      );

      return List.generate(maps.length, (i) {
        return GenreEntity.fromMap(maps[i]).toModel();
      });
    } catch (e) {
      if (kDebugMode) {
        print("GETTING GENRES ERROR: $e");
      }
      return [];
    }
  }
}
