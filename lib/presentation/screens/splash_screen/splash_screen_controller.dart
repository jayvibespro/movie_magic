import 'package:daladala/presentation/screens/auth_screens/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import '../../../core/models/api_response_model.dart';
import '../../../core/models/movie_details_model/movie_details_model.dart';
import '../../../core/services/data_service.dart';
import '../../../core/state/app_state.dart';
import '../../../core/utils/session_manager.dart';

@injectable
class SplashScreenController {
  late void Function(void Function()) _setState;
  late BuildContext _context;

  final AppState appState;
  late final DataService _dataService;
  late final SessionManager _sessionManager;

  SplashScreenController(
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
    checkLoggedInUser();
  }

  Future<void> getGenres() async {
    ApiResponseModel<List<Genre>?> apiResponse = await _dataService.getGenres();
    if (apiResponse.success) {
      appState.genres = apiResponse.data!;
    }
  }

  Future<void> checkLoggedInUser() async {
    await getGenres();
    if (true) {
      Get.to(
        () => SignInScreen(),
        transition: Transition.circularReveal,
        duration: Duration(milliseconds: 1200),
      );
    }
  }
}
