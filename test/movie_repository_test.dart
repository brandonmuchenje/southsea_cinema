import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  test('getMovies returns correct list of mock movies', () {
    final repository = MovieRepository();
    final movies = repository.getMovies();

    expect(movies.isNotEmpty, true);
    expect(movies.length, 2);

    expect(movies[0].id, 'm1');
    expect(movies[0].name, 'Haunted Heists 2026');
    expect(movies[0].description, isNotEmpty);
    expect(movies[0].ageRating, isNotEmpty);
    expect(movies[0].screeningTime, isNotEmpty);
    expect(movies[0].price, 10.99);
    expect(movies[0].imagePath, isNotEmpty);

    expect(movies[1].id, 'm2');
    expect(movies[1].name, 'White Chicks');
    expect(movies[1].description, isNotEmpty);
    expect(movies[1].ageRating, isNotEmpty);
    expect(movies[1].screeningTime, isNotEmpty);
    expect(movies[1].price, 10.99);
    expect(movies[1].imagePath, isNotEmpty);
  });

  test('getMovieById returns matching movie when id exists', () {
    final repository = MovieRepository();
    final movie =
        repository.getMovies().firstWhere((movie) => movie.id == 'm1');

    expect(movie.name, 'Haunted Heists 2026');
    expect(movie.price, 10.99);
  });

  test('getMovieById returns null when id does not exist', () {
    final repository = MovieRepository();
    final movies =
        repository.getMovies().where((movie) => movie.id == 'non-existent');

    expect(movies.isEmpty, isTrue);
  });
}
