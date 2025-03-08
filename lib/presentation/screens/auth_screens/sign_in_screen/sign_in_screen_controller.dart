import 'package:daladala/core/models/api_response_model.dart';
import 'package:daladala/presentation/components/custom_snack_bar.dart';
import 'package:daladala/presentation/screens/auth_screens/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/data_service.dart';
import '../../../../core/state/app_state.dart';
import '../../../../core/utils/session_manager.dart';
import '../../home_screen/home_screen.dart';

@injectable
class SignInScreenController {
  late void Function(void Function()) _setState;
  late BuildContext _context;

  final AppState appState;
  final AuthState state;
  late final DataService _dataService;
  late final SessionManager _sessionManager;

  SignInScreenController(
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
  }

  Future<void> signInUserWithGoogle() async {
    ApiResponseModel<bool> apiResponse = await _dataService.signInWithGoogle();
    if (apiResponse.data == true) {
      Get.offAll(
        () => HomeScreen(),
        transition: Transition.circularReveal,
        duration: Duration(milliseconds: 1600),
      );
    } else {
      customSnackBar(apiResponse.message);
    }
  }

  Future<void> signInUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    state.loading = true;
    _update();
    ApiResponseModel<bool> apiResponse = await _dataService
        .signInWithEmailAndPassword(email, password);
    state.loading = false;
    _update();
    if (apiResponse.data == true) {
      Get.offAll(
        () => HomeScreen(),
        transition: Transition.circularReveal,
        duration: Duration(milliseconds: 1600),
      );
    } else {
      customSnackBar(apiResponse.message);
    }
  }

  void _update() {
    if (!_context.mounted) return;
    _setState(() {});
  }
}
