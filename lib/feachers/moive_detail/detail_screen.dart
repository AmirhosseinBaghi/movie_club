import 'package:flutter/material.dart';
import 'package:movie_club/feachers/moive_detail/presentation/provider/detail_provier.dart';

import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      context.read<DetailProvider>().fetchMovie(id);
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Movie Detail")),
      body: Consumer<DetailProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.movieDetail == null) {
            return const Center(child: Text("No data"));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title: ${provider.movieDetail!.title}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text("Actors: ${provider.movieDetail!.actors}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
