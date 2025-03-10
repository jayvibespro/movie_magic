import 'package:injectable/injectable.dart';
import 'package:movie_magic/core/models/movie_model/movie_model.dart';

import '../../../core/models/people_model/people_model.dart';

@singleton
class HomeState {
  bool loading = false;
  bool isConnected = true;
  String? message;
  List<MovieModel> trendingMovies = [];
  List<MovieModel> latestMovies = [];
  List<MovieModel> discoverMovies = [];
  List<PeopleModel> popularPeople = [];
}
