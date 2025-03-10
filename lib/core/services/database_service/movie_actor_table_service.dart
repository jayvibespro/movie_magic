import 'package:daladala/core/services/database_service/entities/genre_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/movie_details_model/movie_details_model.dart';
import 'entities/movie_actor_entity.dart';

/// For Many to Many Relationship between Movie and Actor
class MovieActorTableService {
  final Database _database;

  MovieActorTableService(this._database);

  Future<void> createMovieActorTable() async {
    await _database.execute('''
        CREATE TABLE movie_actor (
          movie_id INTEGER,
          actor_id INTEGER,
          PRIMARY KEY (movie_id, actor_id),
          FOREIGN KEY (movie_id) REFERENCES movies (id) ON DELETE CASCADE,
          FOREIGN KEY (actor_id) REFERENCES people (id) ON DELETE CASCADE
        )
      ''');
  }

  Future<void> insertMovieActor(int movieId, int actorId) async {
    await _database.insert(MovieActorEntity.tableName, {
      'movie_id': movieId,
      'actor_id': actorId,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
