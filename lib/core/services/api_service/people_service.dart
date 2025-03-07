import 'package:daladala/core/models/api_response_model.dart';
import 'package:daladala/core/models/people_model/people_model.dart';
import 'package:daladala/core/services/base_service.dart';
import 'package:daladala/core/utils/constants/endpoints.dart';

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
}
