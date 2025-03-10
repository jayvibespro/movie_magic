import 'package:daladala/core/services/database_service/database_service.dart';
import 'package:daladala/presentation/screens/auth_screens/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import '../../../core/models/api_response_model.dart';
import '../../../core/models/movie_details_model/movie_details_model.dart';
import '../../../core/services/data_service.dart';
import '../../../core/state/app_state.dart';
import '../../../core/utils/check_connectivity.dart';
import '../home_screen/home_screen.dart';

@injectable
class SplashScreenController {
  late void Function(void Function()) _setState;
  late BuildContext _context;

  final AppState appState;
  late final DataService _dataService;
  late final DatabaseService _databaseService;

  SplashScreenController(
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
    checkLoggedInUser();
  }

  Future<void> getGenres() async {
    await _databaseService.database;
    if (!await checkConnectivity()) {
      appState.genres = await _databaseService.getGenres();
      if (kDebugMode) {
        print("GENRES: ${appState.genres.length}");
      }
    } else {
      ApiResponseModel<List<GenreModel>?> apiResponse =
          await _dataService.getGenres();
      if (apiResponse.success) {
        appState.genres = apiResponse.data!;
        await _databaseService.insertGenres(appState.genres);
      }
    }
  }

  Future<void> checkLoggedInUser() async {
    await getGenres();
    ApiResponseModel<bool> apiResponse = await _dataService.checkLoggedInUser();

    if (apiResponse.data == true) {
      Get.offAll(
        () => HomeScreen(),
        transition: Transition.circularReveal,
        duration: Duration(milliseconds: 1600),
      );
    } else {
      Get.to(
        () => SignInScreen(),
        transition: Transition.circularReveal,
        duration: Duration(milliseconds: 1200),
      );
    }
  }
}
