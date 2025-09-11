import 'package:flutter/material.dart';
import 'package:movie_club/feachers/home/presentation/provider/movie_provider.dart';
import 'package:movie_club/feachers/home/presentation/widgets/banner.dart';
import 'package:movie_club/feachers/home/presentation/widgets/movie_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Now Playing",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Consumer<MovieProvider>(
              builder: (context, movieprovider, child) {
                return BannerStory(movies: movieprovider.getStolyMovies());
              },
            ),
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
