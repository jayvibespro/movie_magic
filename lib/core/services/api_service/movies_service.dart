import 'package:movie_magic/core/models/api_response_model.dart';
import 'package:movie_magic/core/models/movie_details_model/movie_details_model.dart';
import 'package:movie_magic/core/models/movie_model/movie_model.dart';
import 'package:movie_magic/core/services/base_service.dart';
import 'package:movie_magic/core/utils/constants/endpoints.dart';

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

  Future<ApiResponseModel<List<GenreModel>?>> getGenres() async {
    return await get<List<GenreModel>>(
      epGenres,
      fromJson: (data) {
        return (data['genres'] as List<dynamic>)
            .map((json) => GenreModel.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
