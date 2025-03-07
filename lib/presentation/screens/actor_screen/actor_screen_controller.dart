import 'package:daladala/presentation/screens/home_screen/home_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/data_service.dart';
import '../../../../core/state/app_state.dart';
import '../../../../core/utils/session_manager.dart';
import '../../../core/models/api_response_model.dart';
import '../../../core/models/movie_details_model/movie_details_model.dart';

@injectable
class ActorScreenController {
  late void Function(void Function()) _setState;
  late BuildContext _context;

  final AppState appState;
  late final DataService _dataService;
  late final SessionManager _sessionManager;
  late final HomeState state;

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
    getActor();
  }

  Future<void> getActor() async {
    state.loading = true;
    _update();
    ApiResponseModel<MovieDetailsModel?> apiResponse = await _dataService
        .getPeopleDetails(appState.selectedPeople.id);
    if (apiResponse.success) {
      // state.movie = apiResponse.data!;
    }
    state.loading = false;
    _update();
  }

  void _update() {
    if (!_context.mounted) return;
    _setState(() {});
  }
}
