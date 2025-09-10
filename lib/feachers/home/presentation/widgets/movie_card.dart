import 'package:flutter/material.dart';
import 'package:movie_club/feachers/home/data/model/movies_model.dart';

class MovieCard extends StatelessWidget {
  final MoviesModel movies;
  const MovieCard({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
      child: SizedBox(
        width: 120,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movies.poster,
                width: 120,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 4),
            Text(
              movies.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
