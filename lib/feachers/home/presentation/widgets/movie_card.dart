import 'package:flutter/material.dart';
import 'package:movie_club/feachers/home/data/model/movies_model.dart';
import 'package:movie_club/feachers/moive_detail/detail_screen.dart';

class MovieCard extends StatelessWidget {
  final MoviesModel movies;
  final double width;
  final double height;

  const MovieCard({
    super.key,
    required this.movies,
    this.width = 120, // عرض پیش‌فرض
    this.height = 160, // ارتفاع تصویر پیش‌فرض
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return DetailScreen(id: movies.id.toString());
              },
            ),
          );
        },
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  movies.poster,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 4),
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
      ),
    );
  }
}
