import 'package:injectable/injectable.dart';

@singleton
class AuthState {
  bool loading = false;
  String? message;
}
