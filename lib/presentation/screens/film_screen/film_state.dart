import 'package:daladala/core/models/movie_details_model/movie_details_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class FilmState {
  bool loading = false;
  String? message;
  late MovieDetailsModel movie;
}
