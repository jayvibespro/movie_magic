import 'package:injectable/injectable.dart';

@singleton
class HomeState {
  bool loading = false;
  String? message;
}
