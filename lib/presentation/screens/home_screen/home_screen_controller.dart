import 'package:daladala/core/models/api_response_model.dart';
import 'package:daladala/core/models/movie_model/movie_model.dart';
import 'package:daladala/core/models/people_model/people_model.dart';
import 'package:daladala/core/utils/constants/keys.dart';
import 'package:daladala/presentation/screens/home_screen/home_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/data_service.dart';
import '../../../../core/state/app_state.dart';
import '../../../../core/utils/session_manager.dart';

@injectable
class HomeScreenController {
  late void Function(void Function()) _setState;
  late BuildContext _context;

  final AppState appState;
  late final DataService _dataService;
  late final SessionManager _sessionManager;
  late final HomeState state;

  HomeScreenController(
    this.state,
    this.appState,
    this._dataService,
    this._sessionManager,
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
    state.loading = true;
    _update();

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
    ApiResponseModel<List<MovieModel>?> apiResponse =
        await _dataService.getTrendingMovies();
    if (apiResponse.success) {
      state.trendingMovies = apiResponse.data!;
    }
  }

  Future<void> getLatestMovies() async {
    ApiResponseModel<List<MovieModel>?> apiResponse =
        await _dataService.getLatestMovies();
    if (apiResponse.success) {
      state.latestMovies = apiResponse.data!;
    }
  }

  Future<void> getDiscoverMovies() async {
    ApiResponseModel<List<MovieModel>?> apiResponse =
        await _dataService.getDiscoverMovies();
    if (apiResponse.success) {
      state.discoverMovies = apiResponse.data!;
    }
  }

  Future<void> getPopularPeople() async {
    ApiResponseModel<List<PeopleModel>?> apiResponse =
        await _dataService.getPopularPeople();
    if (apiResponse.success) {
      state.popularPeople = apiResponse.data!;
    }
  }

  void _update() {
    if (!_context.mounted) return;
    _setState(() {});
  }
}
