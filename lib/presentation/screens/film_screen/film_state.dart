import 'package:injectable/injectable.dart';

@singleton
class FilmState {
  bool loading = false;
  String? message;
}
