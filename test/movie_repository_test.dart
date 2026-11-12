import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'dart:convert';
import 'package:flutter/services.dart';




void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains valid movie data', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie first = movies[0];
      expect(first.id, 'm1');
      expect(first.name, 'Haunted Heists 2026');
      expect(first.description, isNotEmpty);
      expect(first.ageRating, isNotEmpty);
      expect(first.screeningTime, isNotEmpty);
      expect(first.price, 10.99);
      expect(first.imagePath, isNotEmpty);

      final Movie second = movies[1];
      expect(second.id, 'm2');
      expect(second.name, 'White Chicks');
      expect(second.description, isNotEmpty);
      expect(second.ageRating, isNotEmpty);
      expect(second.screeningTime, isNotEmpty);
      expect(second.price, 10.99);
      expect(second.imagePath, isNotEmpty);
    });

    test('getMovies contains matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie movie =
          repository.getMovies().firstWhere((Movie movie) => movie.id == 'm1');

      expect(movie.name, 'Haunted Heists 2026');
      expect(movie.price, 10.99);
    });

    test('getMovies contains no matching movie when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final bool hasMovie = repository
          .getMovies()
          .any((Movie movie) => movie.id == 'non-existent');

      expect(hasMovie, isFalse);
    });
  });
}
