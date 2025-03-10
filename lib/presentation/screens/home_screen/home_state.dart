import 'package:daladala/core/models/movie_model/movie_model.dart';
import 'package:daladala/core/models/people_model/people_model.dart';
import 'package:injectable/injectable.dart';

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
