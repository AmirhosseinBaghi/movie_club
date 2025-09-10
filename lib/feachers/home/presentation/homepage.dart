import 'package:flutter/material.dart';
import 'package:movie_club/feachers/home/presentation/provider/movie_provider.dart';
import 'package:movie_club/feachers/home/presentation/widgets/movie_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Consumer<MovieProvider>(
            builder: (context, homeProvider, child) {
              return MovieSection(
                title: 'Trending',
                onSeeAllPressed: () {},
                movies: homeProvider.movies,
              );
            },
          ),
        ],
      ),
    );
  }
}
