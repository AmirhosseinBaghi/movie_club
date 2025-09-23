import 'package:flutter/material.dart';
import 'package:movie_club/core/constant/constant.dart';
import 'package:movie_club/feachers/home/data/model/homepage_model.dart';
import 'package:movie_club/feachers/home/data/model/movies_model.dart';
import 'package:movie_club/feachers/home/data/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieProvider(this._movieRepository) {
    fetchMovies(pageIndex);
  }

  final HomePageData _homePageData = HomePageDataConstants.homePageData;
  List<MoviesModel> _moives = [];
  List<MoviesModel> get movies => _moives;
  List<MoviesModel> _moivesearch = [];
  List<MoviesModel> get moviesearch => _moivesearch;
  bool isLoading = false;
  String? errorMassage;
  int pageIndex = 1;
  fetchMovies(int page) async {
    _moives = await _movieRepository.fetchMovie(page);
    pageIndex = page;
    notifyListeners();
  }

  List<MoviesModel> getTrendingMovies() {
    return _moives
        .where((movie) => _homePageData.trending.contains(movie.id))
        .toList();
  }

  List<MoviesModel> getNewReleaseMovie() {
    return _moives
        .where((hotel) => _homePageData.newReleaseMovie.contains(hotel.id))
        .toList();
  }

  List<MoviesModel> getnewReleaseTv() {
    return _moives
        .where((hotel) => _homePageData.newReleaseTv.contains(hotel.id))
        .toList();
  }

  List<MoviesModel> getRecommendedMovies() {
    return _moives
        .where((hotel) => _homePageData.recommended.contains(hotel.id))
        .toList();
  }

  List<MoviesModel> getStolyMovies() {
    final shuffleMovies = List<MoviesModel>.from(_moives)..shuffle();
    return shuffleMovies.take(4).toList();
  }

  Future<List<MoviesModel>> searchMovie(String query) async {
    if (query.isEmpty) {
      _moivesearch = [];
      errorMassage = 'search movie name';
      notifyListeners();
      return _moivesearch;
    }

    try {
      isLoading = true;
      errorMassage = null;
      notifyListeners();
      _moivesearch = await _movieRepository.searchMovie(query);
      if (_moivesearch.isEmpty) {
        errorMassage =
            'Not Found\n\nWe are sorry we cannot find the movie.\nweare constantly updatingthe app to\ncontain all what you want.';
      }
      return _moivesearch;
    } catch (e) {
      _moivesearch = [];
      return _moivesearch;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
