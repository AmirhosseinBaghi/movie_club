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
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              TextButton(
                onPressed: onSeeAllPressed,
                child: Text(
                  "see all",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
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
