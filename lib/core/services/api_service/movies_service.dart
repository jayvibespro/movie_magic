import 'package:daladala/core/models/api_response_model.dart';
import 'package:daladala/core/models/movie_model/movie_model.dart';
import 'package:daladala/core/services/base_service.dart';
import 'package:daladala/core/utils/constants/endpoints.dart';

mixin MoviesService implements BaseService {
  Future<void> testApi() async {
    await get("authentication");
  }

  Future<ApiResponseModel<List<MovieModel>?>> getTrendingMovies() async {
    return await get<List<MovieModel>>(
      epTrendingMovies,
      fromJson: (data) {
        return (data['results'] as List<dynamic>)
            .map((json) => MovieModel.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<ApiResponseModel<List<MovieModel>?>> getLatestMovies() async {
    return await get<List<MovieModel>>(
      epLatestMovies,
      fromJson: (data) {
        return (data['results'] as List<dynamic>)
            .map((json) => MovieModel.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<ApiResponseModel<List<MovieModel>?>> getDiscoverMovies() async {
    return await get<List<MovieModel>>(
      epDiscoverMovies,
      fromJson: (data) {
        return (data['results'] as List<dynamic>)
            .map((json) => MovieModel.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<void> getPopularMovies() async {
    await get(epPopularMovies);
  }

  Future<void> getGenres() async {
    await get(epGenres);
  }
}
