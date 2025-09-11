import 'package:flutter/material.dart';
import 'package:movie_club/core/constant/constant.dart';
import 'package:movie_club/feachers/home/data/model/homepage_model.dart';
import 'package:movie_club/feachers/home/data/model/movies_model.dart';
import 'package:movie_club/feachers/home/data/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieProvider(this._movieRepository) {
    fetchMovies();
  }
  final HomePageData _homePageData = HomePageDataConstants.homePageData;
  List<MoviesModel> _moives = [];
  List<MoviesModel> get movies => _moives;

  fetchMovies() async {
    _moives = await _movieRepository.fetchMovie();
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
}
