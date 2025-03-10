import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/movie_details_model/movie_details_model.dart';
import 'entities/movie_details_entity.dart';

class MovieDetailsTableService {
  final Database _database;

  MovieDetailsTableService(this._database);

  Future<void> createMovieDetailsTable() async {
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS ${MovieDetailsEntity.tableName} (
        ${MovieDetailsEntity.columnId} INTEGER PRIMARY KEY,
        ${MovieDetailsEntity.columnAdult} INTEGER,
        ${MovieDetailsEntity.columnBackdropPath} TEXT,
        ${MovieDetailsEntity.columnBelongsToCollection} TEXT,
        ${MovieDetailsEntity.columnBudget} INTEGER,
        ${MovieDetailsEntity.columnGenres} TEXT,
        ${MovieDetailsEntity.columnHomepage} TEXT,
        ${MovieDetailsEntity.columnImdbId} TEXT,
        ${MovieDetailsEntity.columnOriginCountry} TEXT,
        ${MovieDetailsEntity.columnOriginalLanguage} TEXT,
        ${MovieDetailsEntity.columnOriginalTitle} TEXT,
        ${MovieDetailsEntity.columnOverview} TEXT,
        ${MovieDetailsEntity.columnPopularity} REAL,
        ${MovieDetailsEntity.columnPosterPath} TEXT,
        ${MovieDetailsEntity.columnProductionCompanies} TEXT,
        ${MovieDetailsEntity.columnProductionCountries} TEXT,
        ${MovieDetailsEntity.columnReleaseDate} TEXT,
        ${MovieDetailsEntity.columnRevenue} INTEGER,
        ${MovieDetailsEntity.columnRuntime} INTEGER,
        ${MovieDetailsEntity.columnSpokenLanguages} TEXT,
        ${MovieDetailsEntity.columnStatus} TEXT,
        ${MovieDetailsEntity.columnTagline} TEXT,
        ${MovieDetailsEntity.columnTitle} TEXT,
        ${MovieDetailsEntity.columnVideo} INTEGER,
        ${MovieDetailsEntity.columnVoteAverage} REAL,
        ${MovieDetailsEntity.columnVoteCount} INTEGER
      )
    ''');
  }

  Future<bool> insertMovieDetails(MovieDetailsModel movie) async {
    try {
      await _database.insert(
        MovieDetailsEntity.tableName,
        MovieDetailsEntity.fromModel(movie).toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("INSERT MOVIE DETAILS ERROR: $e");
      }
      return false;
    }
  }

  Future<MovieDetailsModel?> getMovieDetailsById(int movieId) async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query(
        MovieDetailsEntity.tableName,
        where: '${MovieDetailsEntity.columnId} = ?',
        whereArgs: [movieId],
      );

      if (maps.isNotEmpty) {
        return MovieDetailsEntity.fromMap(maps.first).toModel();
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print("GETTING MOVIE DETAILS ERROR: $e");
      }
      return null;
    }
  }
}
