import 'package0:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  final repository = MovieRepository();
  final movies = repository.getMovies();

  expect(movies.isNotEmpty, true);
  expect(movies.first.id, "m1");
  expect(movies.first.name, "Haunted Hesit 2026");
  expect(movies.first.price, 12.50);
}
