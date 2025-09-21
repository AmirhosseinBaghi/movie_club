import 'package:movie_club/feachers/home/data/model/movies_model.dart';
import 'package:movie_club/shared/services/api_service.dart';

class MovieRepository {
  final ApiService apiService;

  MovieRepository({required this.apiService});

  Future<List<MoviesModel>> fetchMovie(int pageIndex) async {
    return apiService.loadMovie(pageIndex);
  }

  Future<List<MoviesModel>> searchMovie(String query) async {
    if (query.isEmpty) {
      return [];
    }
    return apiService.searchMovie(query);
  }
}
