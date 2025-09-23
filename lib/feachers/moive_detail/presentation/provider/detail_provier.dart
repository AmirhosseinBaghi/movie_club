import 'package:flutter/material.dart';
import 'package:movie_club/feachers/moive_detail/data/model/movie_detail_model.dart';
import 'package:movie_club/feachers/moive_detail/data/repository/detail_repository.dart';

class DetailProvider extends ChangeNotifier {
  final DetailScreenRepository repository;

  DetailProvider(this.repository);

  bool isLoading = false;
  MoviedetailModel? _movieDetail;
  MoviedetailModel? get movieDetail => _movieDetail;

  Future<MoviedetailModel> fetchMovie(String id) async {
    isLoading = true;
    notifyListeners();

    try {
      _movieDetail = await repository.fetchMovie(id);
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return _movieDetail!;
  }
}
