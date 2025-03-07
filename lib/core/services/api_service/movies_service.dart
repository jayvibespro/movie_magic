import 'package:daladala/core/models/api_response_model.dart';
import 'package:daladala/core/models/movie_details_model/movie_details_model.dart';
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

  Future<ApiResponseModel<MovieDetailsModel?>> getMovie(int movieId) async {
    return await get<MovieDetailsModel>(
      "$epMovieDetails/$movieId",
      fromJson: (data) {
        return MovieDetailsModel.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  Future<ApiResponseModel<List<Genre>?>> getGenres() async {
    return await get<List<Genre>>(
      epGenres,
      fromJson: (data) {
        return (data['genres'] as List<dynamic>)
            .map((json) => Genre.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
