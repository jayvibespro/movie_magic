import 'package:flutter/foundation.dart';
import 'package:movie_magic/core/models/people_model/people_model.dart';
import 'package:sqflite/sqflite.dart';

import 'entities/people_entity.dart';

class PeopleTableService {
  final Database _database;

  PeopleTableService(this._database);

  Future<void> createPeopleTable() async {
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS ${PeopleEntity.tableName} (
        ${PeopleEntity.columnId} INTEGER PRIMARY KEY,
        ${PeopleEntity.columnAdult} INTEGER,
        ${PeopleEntity.columnGender} INTEGER,
        ${PeopleEntity.columnKnownForDepartment} TEXT,
        ${PeopleEntity.columnName} TEXT,
        ${PeopleEntity.columnOriginalName} TEXT,
        ${PeopleEntity.columnAlsoKnownAs} TEXT,
        ${PeopleEntity.columnBiography} TEXT,
        ${PeopleEntity.columnBirthday} TEXT,
        ${PeopleEntity.columnPopularity} REAL,
        ${PeopleEntity.columnProfilePath} TEXT,
        ${PeopleEntity.columnPlaceOfBirth} TEXT
      )
    ''');
  }

  Future<bool> insertPeople(List<PeopleModel> people) async {
    try {
      final batch = _database.batch();

      for (var actor in people) {
        batch.insert(
          PeopleEntity.tableName,
          actor.toEntity().toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit(
        noResult: true,
      ); // Executes all inserts in a single transaction
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("INSERT PEOPLE ERROR: $e");
      }
      return false;
    }
  }

  Future<List<PeopleModel>> getPeople() async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query(
        PeopleEntity.tableName,
      );

      maps.map((map) => PeopleEntity.fromMap(map)).toList();

      return maps.map((map) => PeopleEntity.fromMap(map).toModel()).toList();
    } catch (e) {
      if (kDebugMode) {
        print("GETTING PEOPLE ERROR: $e");
      }
      return [];
    }
  }
}
