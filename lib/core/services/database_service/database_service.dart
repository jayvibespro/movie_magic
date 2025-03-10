import 'package:daladala/core/models/movie_details_model/movie_details_model.dart';
import 'package:daladala/core/models/people_model/people_model.dart';
import 'package:daladala/core/services/database_service/genre_table_service.dart';
import 'package:daladala/core/services/database_service/people_table_service.dart';
import 'package:daladala/core/services/database_service/profile_table_service.dart';
import 'package:daladala/core/services/database_service/movie_details_table_service.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/movie_model/movie_model.dart';
import '../../models/profile_model/profile_model.dart';
import 'movie_actor_table_service.dart';
import 'movie_table_service.dart';

/// Service Class to handle all database function for Offline mode.
@singleton
class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  late GenreTableService _genreTableService;
  late ProfileTableService _profileTableService;
  late PeopleTableService _peopleTableService;
  late MovieTableService _movieTableService;
  late MovieActorTableService _movieActorTableService;
  late MovieDetailsTableService _movieDetailsTableService;

  DatabaseService._internal();

  factory DatabaseService() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();

    await _initTableServices();
    return _database!;
  }

  Future<void> _initTableServices() async {
    final db = await database;
    _genreTableService = GenreTableService(db);
    _profileTableService = ProfileTableService(db);
    _peopleTableService = PeopleTableService(db);
    _movieTableService = MovieTableService(db);
    _movieActorTableService = MovieActorTableService(db);
    _movieDetailsTableService = MovieDetailsTableService(db);
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'movie_magic_db.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _onCreate(db, version);
      },
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await _createTables(db);
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Handle database upgrades here
  }

  Future<void> _createTables(Database db) async {
    _genreTableService = GenreTableService(db);
    _profileTableService = ProfileTableService(db);
    _peopleTableService = PeopleTableService(db);
    _movieTableService = MovieTableService(db);
    _movieActorTableService = MovieActorTableService(db);
    _movieDetailsTableService = MovieDetailsTableService(db);

    await _genreTableService.createGenreTable();
    await _profileTableService.createProfileTable();
    await _peopleTableService.createPeopleTable();
    await _movieTableService.createMovieTable();
    await _movieActorTableService.createMovieActorTable();
    await _movieDetailsTableService.createMovieDetailsTable();
  }

  Future<void> closeDatabase() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
      _database = null;
    }
  }

  /* GENRE ACTIONS */
  Future<bool> insertGenres(List<GenreModel> cityModels) async {
    return await _genreTableService.insertGenres(cityModels);
  }

  Future<List<GenreModel>> getGenres() async {
    return await _genreTableService.getGenres();
  }

  /* PROFILE ACTIONS */
  Future<bool> insertProfiles(List<ProfileModel> profiles, int actorId) async {
    return await _profileTableService.insertProfiles(profiles, actorId);
  }

  Future<List<ProfileModel>> getProfiles(int actorId) async {
    return await _profileTableService.getProfiles(actorId);
  }

  /* PEOPLE ACTIONS */
  Future<bool> insertPeople(List<PeopleModel> people) async {
    return await _peopleTableService.insertPeople(people);
  }

  Future<List<PeopleModel>> getPeople() async {
    return await _peopleTableService.getPeople();
  }

  /* MOVIE ACTIONS */
  Future<bool> insertMovies(List<MovieModel> movies, String section) async {
    return await _movieTableService.insertMovies(movies, section);
  }

  Future<List<MovieModel>> getMovies(String section) async {
    return await _movieTableService.getMovies(section);
  }

  Future<List<MovieModel>> getMoviesByActor(int actorId) async {
    return await _movieTableService.getMoviesByActor(actorId);
  }

  /* MOVIE DETAILS ACTIONS */
  Future<bool> insertMovieDetails(MovieDetailsModel movie) async {
    return await _movieDetailsTableService.insertMovieDetails(movie);
  }

  Future<MovieDetailsModel?> getMovieDetailsById(int movieId) async {
    return await _movieDetailsTableService.getMovieDetailsById(movieId);
  }

  /* MOVIE ACTOR ACTIONS */
  Future<void> insertMovieActor(int movieId, int actorId) async {
    return await _movieActorTableService.insertMovieActor(movieId, actorId);
  }
}
