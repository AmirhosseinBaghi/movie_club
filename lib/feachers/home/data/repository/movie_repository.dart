import 'package:movie_club/feachers/home/data/model/movies_model.dart';
import 'package:movie_club/shared/services/api_service.dart';

class MovieRepository {
  final ApiService apiService;

  MovieRepository({required this.apiService});

  Future<List<MoviesModel>> fetchMovie() async {
    return apiService.loadMovie();
  }
}
