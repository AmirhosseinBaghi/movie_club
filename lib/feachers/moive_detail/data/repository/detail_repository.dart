import 'package:movie_club/feachers/moive_detail/data/model/movie_detail_model.dart';
import 'package:movie_club/shared/services/api_service.dart';

class DetailScreenRepository {
  final ApiService apiService;

  DetailScreenRepository({required this.apiService});

  Future<MoviedetailModel> fetchMovie(String id) async {
    return apiService.detailMovie(id);
  }
}
