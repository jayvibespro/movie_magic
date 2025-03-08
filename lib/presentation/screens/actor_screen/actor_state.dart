import 'package:daladala/core/models/movie_model/movie_model.dart';
import 'package:daladala/core/models/people_model/people_model.dart';
import 'package:daladala/core/models/profile_model/profile_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class ActorState {
  bool loading = false;
  String? message;
  late PeopleModel actor;
  List<ProfileModel> profiles = [];
  List<MovieModel> knownFor = [];
}
