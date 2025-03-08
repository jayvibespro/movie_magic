import 'package:injectable/injectable.dart';

import 'api_service/auth_service.dart';
import 'api_service/movies_service.dart';
import 'api_service/people_service.dart';
import 'firebase_service/firebase_service.dart';

@singleton
class DataService extends AuthService
    with MoviesService, PeopleService, FirebaseService {}
