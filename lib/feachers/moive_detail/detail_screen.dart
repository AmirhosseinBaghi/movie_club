import 'package:flutter/material.dart';
import 'package:movie_club/feachers/moive_detail/data/model/movie_detail_model.dart';
import 'package:movie_club/feachers/moive_detail/data/repository/detail_repository.dart';
import 'package:movie_club/feachers/moive_detail/presentation/provider/detail_provier.dart';
import 'package:movie_club/shared/services/api_service.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviedetailModel>(
      future: DetailProvider(
        DetailScreenRepository(apiService: ApiService()),
      ).fetchMovie(id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        final movie = snapshot.data!;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  background: GestureDetector(
                    onLongPress: () {},
                    child: Image.network(movie.poster, fit: BoxFit.fill),
                  ),
                ),
                expandedHeight: 300,
                elevation: 8,
                leading: BackButton(color: Colors.white),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        children: movie.genres.map((e) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.white,
                            ),
                            child: Text(
                              e,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Color(0xFF34344A)),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer_sharp),
                              SizedBox(width: 4),
                              Text(
                                movie.runtime,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_month_outlined),
                              SizedBox(width: 4),
                              Text(
                                movie.year,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star),
                              SizedBox(width: 4),
                              Text(
                                movie.imdbRating,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Text(
                            '${movie.imdbVotes}k Review',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text(
                        movie.plot,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Details',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Country : ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            movie.country,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Date Release : ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            movie.released,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
