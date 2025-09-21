import 'package:flutter/material.dart';
import 'package:movie_club/feachers/home/presentation/provider/movie_provider.dart';
import 'package:movie_club/feachers/home/presentation/widgets/all_movie.dart';
import 'package:movie_club/feachers/home/presentation/widgets/banner.dart';
import 'package:movie_club/feachers/home/presentation/widgets/fake_searchbar.dart';
import 'package:movie_club/feachers/home/presentation/widgets/movie_section.dart';
import 'package:movie_club/feachers/home/presentation/widgets/search_bar.dart';
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
            FakeSearchbar(
              onpress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchBarWidget()),
                );
              },
            ),
            // SearchBarWidget(),
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
                  onSeeAllPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllMovie()),
                    );
                  },
                  movies: homeProvider.getTrendingMovies(),
                );
              },
            ),
            Consumer<MovieProvider>(
              builder: (context, homeProvider, child) {
                return MovieSection(
                  title: 'New Release - Movies',
                  onSeeAllPressed: () {},
                  movies: homeProvider.getNewReleaseMovie(),
                );
              },
            ),
            Consumer<MovieProvider>(
              builder: (context, homeProvider, child) {
                return MovieSection(
                  title: 'New Release - Tv Show',
                  onSeeAllPressed: () {},
                  movies: homeProvider.getnewReleaseTv(),
                );
              },
            ),
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
