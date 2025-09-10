import 'package:flutter/material.dart';
import 'package:movie_club/feachers/home/data/model/movies_model.dart';
import 'package:movie_club/feachers/home/presentation/widgets/movie_card.dart';

class MovieSection extends StatelessWidget {
  final List<MoviesModel> movies;
  final String title;
  final VoidCallback? onSeeAllPressed;
  const MovieSection({
    super.key,
    required this.title,
    required this.onSeeAllPressed,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              TextButton(onPressed: onSeeAllPressed, child: Text("see all")),
            ],
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 350,
          child: ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieCard(movies: movies[index]);
            },
          ),
        ),
      ],
    );
  }
}
