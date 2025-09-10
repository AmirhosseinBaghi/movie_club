import 'package:movie_club/feachers/home/data/model/homepage_model.dart';

class AppConstant {
  static const String baseUrl = 'https://moviesapi.ir/api/v1';
}

class HomePageDataConstants {
  static const List<int> _trendingIds = [1, 3, 5, 7];
  static const List<int> _newReleaseMovieIds = [2, 4, 6, 8];
  static const List<int> _newReleaseTvIds = [1, 4, 9];
  static const List<int> _recommendedIds = [3, 6, 9, 10];

  static HomePageData get homePageData => HomePageData(
    trending: _trendingIds,
    newReleaseMovie: _newReleaseMovieIds,
    newReleaseTv: _newReleaseTvIds,
    recommended: _recommendedIds,
  );
}
