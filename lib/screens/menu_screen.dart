import 'package:flutter/material.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieRepository respository = MovieRepository();
    final movies = respository.getMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Southsea Cinema",
        style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: movies[index]);
        },
      ),
    );
  }
}
