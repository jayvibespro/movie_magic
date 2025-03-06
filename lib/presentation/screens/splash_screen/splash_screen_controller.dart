import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../core/models/api_response_model.dart';
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

  SplashScreenController(this.appState, this._dataService);

  void initialize(
    void Function(void Function()) setState,
    BuildContext context,
  ) {
    _setState = setState;
    _context = context;
    _sessionManager = SessionManager();
  }
}
