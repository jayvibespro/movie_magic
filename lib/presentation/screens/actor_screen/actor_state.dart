import 'package:injectable/injectable.dart';
import 'package:movie_magic/core/models/movie_model/movie_model.dart';
import 'package:movie_magic/core/models/people_model/people_model.dart';

import '../../../core/models/profile_model/profile_model.dart';

@singleton
class ActorState {
  bool loading = false;
  bool isConnected = true;
  String? message;
  late PeopleModel actor;
  List<ProfileModel> profiles = [];
  List<MovieModel> knownFor = [];
}
