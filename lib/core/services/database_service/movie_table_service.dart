import 'package:flutter/foundation.dart';
import 'package:movie_magic/core/models/movie_model/movie_model.dart';
import 'package:sqflite/sqflite.dart';

import 'entities/movie_entity.dart';

class MovieTableService {
  final Database _database;

  MovieTableService(this._database);

  Future<void> createMovieTable() async {
    await _database.execute('''
    CREATE TABLE IF NOT EXISTS ${MovieEntity.tableName} (
      ${MovieEntity.columnId} INTEGER PRIMARY KEY,
      ${MovieEntity.columnBackdropPath} TEXT,
      ${MovieEntity.columnTitle} TEXT,
      ${MovieEntity.columnOriginalTitle} TEXT,
      ${MovieEntity.columnOverview} TEXT,
      ${MovieEntity.columnPosterPath} TEXT,
      ${MovieEntity.columnMediaType} TEXT,
      ${MovieEntity.columnAdult} INTEGER,
      ${MovieEntity.columnOriginalLanguage} TEXT,
      ${MovieEntity.columnGenreIds} TEXT,
      ${MovieEntity.columnPopularity} REAL,
      ${MovieEntity.columnReleaseDate} TEXT,
      ${MovieEntity.columnVideo} INTEGER,
      ${MovieEntity.columnVoteAverage} REAL,
      ${MovieEntity.columnVoteCount} INTEGER,
      ${MovieEntity.columnSection} TEXT
    )
  ''');
  }

  Future<bool> insertMovies(List<MovieModel> movies, String section) async {
    try {
      final batch = _database.batch(); // Start a batch

      for (var movie in movies) {
        MovieEntity newMovie = movie.toEntity();
        newMovie.section = section;

        batch.insert(
          MovieEntity.tableName,
          newMovie.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit(
        noResult: true,
      ); // Commit batch to execute all inserts at once
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("INSERT MOVIE ERROR: $e");
      }
      return false;
    }
  }

  Future<List<MovieModel>> getMovies(String section) async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query(
        MovieEntity.tableName,
        where: '${MovieEntity.columnSection} = ?',
        whereArgs: [section],
      );

      return maps.map((map) => MovieEntity.fromMap(map).toModel()).toList();
    } catch (e) {
      if (kDebugMode) {
        print("GETTING MOVIES ERROR: $e");
      }
      return [];
    }
  }

  Future<List<MovieModel>> getMoviesByActor(int actorId) async {
    final List<Map<String, dynamic>> maps = await _database.rawQuery(
      '''
    SELECT movies.* FROM movies
    INNER JOIN movie_actor ON movies.id = movie_actor.movie_id
    WHERE movie_actor.actor_id = ?
  ''',
      [actorId],
    );

    return maps.map((map) => MovieEntity.fromMap(map).toModel()).toList();
  }
}
