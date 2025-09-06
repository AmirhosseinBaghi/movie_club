import 'package:flutter/material.dart';
import 'package:movie_club/feachers/home/data/model/movies_model.dart';
import 'package:movie_club/feachers/home/data/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieProvider(this._movieRepository) {
    fetchMovies();
  }

  List<MoviesModel> _moives = [];
  List<MoviesModel> get movies => _moives;

  fetchMovies() async {
    _moives = await _movieRepository.fetchMovie();
    notifyListeners();
  }
}
