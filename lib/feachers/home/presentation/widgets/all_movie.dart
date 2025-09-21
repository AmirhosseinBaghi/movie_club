import 'package:flutter/material.dart';
import 'package:movie_club/feachers/home/presentation/provider/movie_provider.dart';
import 'package:movie_club/feachers/home/presentation/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class AllMovie extends StatelessWidget {
  const AllMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          return CustomScrollView(
            slivers: [
              // شبکه فیلم‌ها
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return MovieCard(movies: movieProvider.movies[index]);
                  }, childCount: movieProvider.movies.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.65,
                  ),
                ),
              ),

              // شماره صفحات (پایین آخر لیست)
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 12),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final pageNumber = index + 1;
                        return GestureDetector(
                          onTap: () {
                            movieProvider.fetchMovies(pageNumber);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: movieProvider.pageIndex == pageNumber
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "$pageNumber",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: movieProvider.pageIndex == pageNumber
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
