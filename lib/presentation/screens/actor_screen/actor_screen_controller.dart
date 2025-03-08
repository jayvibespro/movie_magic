import 'package:daladala/core/models/movie_model/movie_model.dart';
import 'package:daladala/core/models/profile_model/profile_model.dart';
import 'package:daladala/presentation/screens/actor_screen/actor_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/data_service.dart';
import '../../../../core/state/app_state.dart';
import '../../../../core/utils/session_manager.dart';
import '../../../core/models/api_response_model.dart';
import '../../../core/models/people_model/people_model.dart';

@injectable
class ActorScreenController {
  late void Function(void Function()) _setState;
  late BuildContext _context;

  final AppState appState;
  late final DataService _dataService;
  late final SessionManager _sessionManager;
  late final ActorState state;

  ActorScreenController(
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
    getData();
  }

  Future<void> getActor() async {
    ApiResponseModel<PeopleModel?> apiResponse = await _dataService
        .getPeopleDetails(appState.selectedPeople.id);
    if (apiResponse.success) {
      state.actor = apiResponse.data!;
    }
  }

  Future<void> getActorMovies() async {
    ApiResponseModel<List<MovieModel>?> apiResponse = await _dataService
        .getActorMovies(appState.selectedPeople.id);
    if (apiResponse.success) {
      state.knownFor = apiResponse.data!;
    }
  }

  Future<void> getActorImages() async {
    ApiResponseModel<List<ProfileModel>?> apiResponse = await _dataService
        .getActorImages(appState.selectedPeople.id);
    if (apiResponse.success) {
      state.profiles = apiResponse.data!;
    }
  }

  Future<void> getData() async {
    state.loading = true;
    _update();

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
