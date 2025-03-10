import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/profile_model/profile_model.dart';
import 'entities/profile_entity.dart';

class ProfileTableService {
  final Database _database;

  ProfileTableService(this._database);

  Future<void> createProfileTable() async {
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS ${ProfileEntity.tableName} (
        ${ProfileEntity.columnFilePath} TEXT PRIMARY KEY,
        ${ProfileEntity.columnActorId} INTEGER,
        ${ProfileEntity.columnAspectRatio} REAL,
        ${ProfileEntity.columnHeight} INTEGER,
        ${ProfileEntity.columnIso6391} INTEGER,
        ${ProfileEntity.columnVoteAverage} REAL,
        ${ProfileEntity.columnVoteCount} INTEGER,
        ${ProfileEntity.columnWidth} INTEGER
      )
    ''');
  }

  Future<bool> insertProfiles(List<ProfileModel> profiles, int actorId) async {
    try {
      final batch = _database.batch();

      for (var profile in profiles) {
        ProfileEntity profileEntity = profile.toEntity();
        profileEntity.actorId = actorId;

        batch.insert(
          ProfileEntity.tableName,
          profileEntity.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit(
        noResult: true,
      ); // Executes all inserts in a single transaction
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("INSERT PROFILE ERROR: $e");
      }
      return false;
    }
  }

  Future<List<ProfileModel>> getProfiles(int actorId) async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query(
        ProfileEntity.tableName,
        where: '${ProfileEntity.columnActorId} = ?',
        whereArgs: [actorId],
      );

      return maps.map((map) => ProfileEntity.fromMap(map).toModel()).toList();
    } catch (e) {
      if (kDebugMode) {
        print("GETTING PROFILES ERROR: $e");
      }
      return [];
    }
  }
}
