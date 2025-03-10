import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_magic/core/models/api_response_model.dart';
import 'package:movie_magic/core/models/movie_model/movie_model.dart';
import 'package:movie_magic/core/models/people_model/people_model.dart';
import 'package:movie_magic/core/utils/check_connectivity.dart';
import 'package:movie_magic/presentation/screens/home_screen/home_state.dart';

import '../../../../core/services/data_service.dart';
import '../../../../core/state/app_state.dart';
import '../../../core/models/movie_details_model/movie_details_model.dart';
import '../../../core/services/database_service/database_service.dart';

@injectable
class HomeScreenController {
  late void Function(void Function()) _setState;
  late BuildContext _context;

  final AppState appState;
  late final DataService _dataService;
  late final DatabaseService _databaseService;
  late final HomeState state;

  HomeScreenController(
    this.state,
    this.appState,
    this._dataService,
    this._databaseService,
  );

  void initialize(
    void Function(void Function()) setState,
    BuildContext context,
  ) {
    _setState = setState;
    _context = context;
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    if (state.discoverMovies.isEmpty &&
        state.popularPeople.isEmpty &&
        state.trendingMovies.isEmpty &&
        state.latestMovies.isEmpty) {
      state.loading = true;
    }
    _update();

    state.isConnected = await checkConnectivity();
    await _databaseService.database;

    final futures = [
      getDiscoverMovies(),
      getTrendingMovies(),
      getLatestMovies(),
      getPopularPeople(),
    ];

    await Future.wait(futures);

    state.loading = false;
    _update();
  }

  Future<void> getTrendingMovies() async {
    if (!state.isConnected) {
      state.trendingMovies = await _databaseService.getMovies('trending');
      if (kDebugMode) {
        print("TRENDING MOVIES: ${state.trendingMovies.length}");
      }
    } else {
      ApiResponseModel<List<MovieModel>?> apiResponse =
          await _dataService.getTrendingMovies();
      if (apiResponse.success) {
        state.trendingMovies = apiResponse.data!;
        await Future.delayed(Duration(seconds: 2));
        _databaseService.insertMovies(state.trendingMovies, 'trending');
      }
    }
  }

  Future<void> getLatestMovies() async {
    if (!state.isConnected) {
      state.latestMovies = await _databaseService.getMovies('latest');
      if (kDebugMode) {
        print("LATEST MOVIES: ${state.latestMovies.length}");
      }
    } else {
      ApiResponseModel<List<MovieModel>?> apiResponse =
          await _dataService.getLatestMovies();
      if (apiResponse.success) {
        state.latestMovies = apiResponse.data!;
        await Future.delayed(Duration(seconds: 4));
        _databaseService.insertMovies(state.latestMovies, 'latest');
      }
    }
  }

  Future<void> getDiscoverMovies() async {
    if (!state.isConnected) {
      state.discoverMovies = await _databaseService.getMovies('discover');
      if (kDebugMode) {
        print("DISCOVERED MOVIES: ${state.discoverMovies.length}");
      }
    } else {
      ApiResponseModel<List<MovieModel>?> apiResponse =
          await _dataService.getDiscoverMovies();
      if (apiResponse.success) {
        state.discoverMovies = apiResponse.data!;

        for (var movie in state.discoverMovies) {
          List<GenreModel> genres = [];

          for (var genre in appState.genres) {
            if (movie.genreIds.contains(genre.id)) {
              genres.add(genre);
            }
          }

          movie.genres = genres;
        }
      }
      _databaseService.insertMovies(state.discoverMovies, 'discover');
    }
  }

  Future<void> getPopularPeople() async {
    if (!state.isConnected) {
      state.popularPeople = await _databaseService.getPeople();
      if (kDebugMode) {
        print("PEOPLE: ${state.popularPeople.length}");
      }
    } else {
      ApiResponseModel<List<PeopleModel>?> apiResponse =
          await _dataService.getPopularPeople();
      if (apiResponse.success) {
        state.popularPeople = apiResponse.data!;
        _databaseService.insertPeople(state.popularPeople);
      }
    }
  }

  void _update() {
    if (!_context.mounted) return;
    _setState(() {});
  }
}
