import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_club/core/constant/constant.dart';
import 'package:movie_club/feachers/home/data/model/movies_model.dart';
import 'package:movie_club/feachers/moive_detail/data/model/movie_detail_model.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));
  Future<List<MoviesModel>> loadMovie(int pageIndex) async {
    try {
      Response response = await dio.get(
        '/movies',
        queryParameters: {'page': pageIndex},
      );
      List<dynamic> moviesList = response.data["data"];
      return moviesList.map((movie) => MoviesModel.fromJson(movie)).toList();
    } catch (e) {
      throw Exception('faild to load moives : $e');
    }
  }

  Future<List<MoviesModel>> searchMovie(String query) async {
    try {
      Response response = await dio.get(
        '/movies',
        queryParameters: {'q': query},
      );
      List<dynamic> moviesList = response.data["data"];
      return moviesList.map((movie) => MoviesModel.fromJson(movie)).toList();
    } catch (e) {
      throw Exception('faild to load moives : $e');
    }
  }

  Future<MoviedetailModel> detailMovie(String id) async {
    try {
      Response response = await dio.get('/movies/$id');
      final movie = MoviedetailModel.fromJson(response.data);
      return movie;
    } catch (e) {
      throw Exception('faild to load moives : $e');
    }
  }
}
