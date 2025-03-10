import 'package:daladala/core/models/movie_model/movie_model.dart';
import 'package:daladala/core/models/people_model/people_model.dart';
import 'package:injectable/injectable.dart';

import '../models/movie_details_model/movie_details_model.dart';

/// This is a shared state. In case and state is to be accessed by multiple controllers, then is is registered in this class. ie. userData
@singleton
class AppState {
  late MovieModel selectedMovie;
  late PeopleModel selectedPeople;
  List<GenreModel> genres = [];
}
