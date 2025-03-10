import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_magic/core/utils/check_connectivity.dart';
import 'package:movie_magic/presentation/screens/film_screen/film_state.dart';

import '../../../../core/services/data_service.dart';
import '../../../core/models/api_response_model.dart';
import '../../../core/models/movie_details_model/movie_details_model.dart';
import '../../../core/services/database_service/database_service.dart';
import '../../../core/state/app_state.dart';

@injectable
class FilmScreenController {
  late void Function(void Function()) _setState;
  late BuildContext _context;

  final AppState appState;
  late final DataService _dataService;
  late final DatabaseService _databaseService;
  late final FilmState state;

  FilmScreenController(
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

    getMovie();
  }

  Future<void> getMovie() async {
    state.loading = true;
    _update();
    await _databaseService.database;
    state.message = null;

    if (!await checkConnectivity()) {
      MovieDetailsModel? newMovie = await _databaseService.getMovieDetailsById(
        appState.selectedMovie.id,
      );
      if (newMovie == null) {
        state.message =
            "Movie Details not found.\nPlease connect to the internet and try again.";
      } else {
        state.movie = newMovie;
      }
    } else {
      ApiResponseModel<MovieDetailsModel?> apiResponse = await _dataService
          .getMovie(appState.selectedMovie.id);
      if (apiResponse.success) {
        state.movie = apiResponse.data!;
      }
    }
    state.loading = false;
    _update();
  }

  void _update() {
    if (!_context.mounted) return;
    _setState(() {});
  }
}
