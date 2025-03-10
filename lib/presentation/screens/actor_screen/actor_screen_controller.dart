import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_magic/core/models/movie_model/movie_model.dart';
import 'package:movie_magic/core/models/profile_model/profile_model.dart';
import 'package:movie_magic/presentation/screens/actor_screen/actor_state.dart';

import '../../../../core/services/data_service.dart';
import '../../../../core/state/app_state.dart';
import '../../../core/models/api_response_model.dart';
import '../../../core/models/people_model/people_model.dart';
import '../../../core/services/database_service/database_service.dart';
import '../../../core/utils/check_connectivity.dart';

@injectable
class ActorScreenController {
  late void Function(void Function()) _setState;
  late BuildContext _context;

  final AppState appState;
  late final DataService _dataService;
  late final DatabaseService _databaseService;
  late final ActorState state;

  ActorScreenController(
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
    getData();
  }

  Future<void> getActor() async {
    if (!state.isConnected) {
      state.actor = appState.selectedPeople;
    } else {
      ApiResponseModel<PeopleModel?> apiResponse = await _dataService
          .getPeopleDetails(appState.selectedPeople.id);
      if (apiResponse.success) {
        state.actor = apiResponse.data!;
      }
    }
  }

  Future<void> getActorMovies() async {
    if (!state.isConnected) {
      state.knownFor = await _databaseService.getMoviesByActor(
        appState.selectedPeople.id,
      );
      if (kDebugMode) {
        print("ACTOR MOVIES: ${state.knownFor.length}");
      }
    } else {
      ApiResponseModel<List<MovieModel>?> apiResponse = await _dataService
          .getActorMovies(appState.selectedPeople.id);
      if (apiResponse.success) {
        state.knownFor = apiResponse.data!;
        await _databaseService.insertMovies(state.knownFor, "actors_movies");
        for (var movie in state.knownFor) {
          await _databaseService.insertMovieActor(
            movie.id,
            appState.selectedPeople.id,
          );
        }
      }
    }
  }

  Future<void> getActorImages() async {
    if (!state.isConnected) {
      state.profiles = await _databaseService.getProfiles(
        appState.selectedPeople.id,
      );
      if (kDebugMode) {
        print("ACTOR PROFILES: ${state.knownFor.length}");
      }
    } else {
      ApiResponseModel<List<ProfileModel>?> apiResponse = await _dataService
          .getActorImages(appState.selectedPeople.id);
      if (apiResponse.success) {
        state.profiles = apiResponse.data!;
        await Future.delayed(Duration(seconds: 2));
        _databaseService.insertProfiles(
          state.profiles,
          appState.selectedPeople.id,
        );
      }
    }
  }

  Future<void> getData() async {
    state.loading = true;
    _update();

    state.isConnected = await checkConnectivity();
    await _databaseService.database;

    final futures = [getActor(), getActorMovies(), getActorImages()];

    await Future.wait(futures);

    state.loading = false;
    _update();
  }

  void _update() {
    if (!_context.mounted) return;
    _setState(() {});
  }
}
