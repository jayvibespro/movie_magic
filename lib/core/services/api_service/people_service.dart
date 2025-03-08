import 'package:daladala/core/models/api_response_model.dart';
import 'package:daladala/core/models/movie_model/movie_model.dart';
import 'package:daladala/core/models/people_model/people_model.dart';
import 'package:daladala/core/models/profile_model/profile_model.dart';
import 'package:daladala/core/services/base_service.dart';
import 'package:daladala/core/utils/constants/endpoints.dart';

import '../../models/movie_details_model/movie_details_model.dart';

mixin PeopleService implements BaseService {
  Future<ApiResponseModel<List<PeopleModel>?>> getPopularPeople() async {
    return await get<List<PeopleModel>>(
      epPopularPeople,
      fromJson: (data) {
        return (data['results'] as List<dynamic>)
            .map((json) => PeopleModel.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<ApiResponseModel<PeopleModel?>> getPeopleDetails(int peopleId) async {
    return await get<PeopleModel>(
      "$epPeopleDetails/$peopleId",
      fromJson: (data) {
        return PeopleModel.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  Future<ApiResponseModel<List<MovieModel>?>> getActorMovies(
    int peopleId,
  ) async {
    return await get<List<MovieModel>>(
      "$epPeopleDetails/$peopleId/movie_credits",
      fromJson: (data) {
        return (data['cast'] as List<dynamic>)
            .map((json) => MovieModel.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<ApiResponseModel<List<ProfileModel>?>> getActorImages(
    int peopleId,
  ) async {
    return await get<List<ProfileModel>>(
      "$epPeopleDetails/$peopleId/images",
      fromJson: (data) {
        return (data['profiles'] as List<dynamic>)
            .map((json) => ProfileModel.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
