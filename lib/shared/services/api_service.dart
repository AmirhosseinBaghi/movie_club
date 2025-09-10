import 'package:dio/dio.dart';
import 'package:movie_club/core/constant/constant.dart';
import 'package:movie_club/feachers/home/data/model/movies_model.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));
  Future<List<MoviesModel>> loadMovie() async {
    try {
      Response response = await dio.get('/movies');
      List<dynamic> moviesList = response.data["data"];
      return moviesList.map((movie) => MoviesModel.fromJson(movie)).toList();
    } catch (e) {
      throw Exception('faild to load moives : $e');
    }
  }
}
