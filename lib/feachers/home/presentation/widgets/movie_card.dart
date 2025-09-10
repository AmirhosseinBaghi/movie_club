import 'package:flutter/material.dart';
import 'package:movie_club/feachers/home/data/model/movies_model.dart';

class MovieCard extends StatelessWidget {
  final MoviesModel movies;
  const MovieCard({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
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
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
