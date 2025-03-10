import 'package:injectable/injectable.dart';

import '../../../core/models/movie_details_model/movie_details_model.dart';

@singleton
class FilmState {
  bool loading = false;
  bool isConnected = true;
  String? message;
  late MovieDetailsModel movie;
}
