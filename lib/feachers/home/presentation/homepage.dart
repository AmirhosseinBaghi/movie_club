import 'package:flutter/material.dart';
import 'package:movie_club/feachers/home/presentation/provider/movie_provider.dart';
import 'package:movie_club/feachers/home/presentation/widgets/movie_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<MovieProvider>(
              builder: (context, homeProvider, child) {
                return MovieSection(
                  title: 'Trending',
                  onSeeAllPressed: () {},
                  movies: homeProvider.getTrendingMovies(),
                );
              },
            ),
            // SizedBox(height: 8),
            Consumer<MovieProvider>(
              builder: (context, homeProvider, child) {
                return MovieSection(
                  title: 'New Release - Movies',
                  onSeeAllPressed: () {},
                  movies: homeProvider.getNewReleaseMovie(),
                );
              },
            ),
            // SizedBox(height: 8),
            Consumer<MovieProvider>(
              builder: (context, homeProvider, child) {
                return MovieSection(
                  title: 'New Release - Tv Show',
                  onSeeAllPressed: () {},
                  movies: homeProvider.getnewReleaseTv(),
                );
              },
            ),
            // SizedBox(height: 8),
            Consumer<MovieProvider>(
              builder: (context, homeProvider, child) {
                return MovieSection(
                  title: 'Recommended',
                  onSeeAllPressed: () {},
                  movies: homeProvider.getRecommendedMovies(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
