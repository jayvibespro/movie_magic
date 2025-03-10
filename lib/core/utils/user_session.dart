import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_magic/core/services/data_service.dart';
import 'package:movie_magic/core/utils/check_connectivity.dart';

import '../di/di.dart';

/// Secured User data Session
class UserSession {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();
  final DataService _dataService = getIt<DataService>();

  /// Store the access token securely
  Future<void> setAccessToken() async {
    if (!await checkConnectivity()) return;
    String? token = await _dataService.getAccessToken();
    if (token != null) {
      await _storage.write(key: 'access_token', value: token);
    }
  }

  /// Get the access token securely
  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }

  /// Remove the access token securely (if needed)
  Future<void> removeAccessToken() async {
    await _storage.delete(key: 'access_token');
  }
}
