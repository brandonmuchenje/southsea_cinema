import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  final repository = MovieRepository();
  final movies = repository.getMovies();

  expect(movies.isNotEmpty, true);
  expect(movies.length, 2);

  
  expect(movies[0].id, "m1");
  expect(movies[0].name, "Haunted Hesit 2026");
  expect(movies[0].price, 10.99);

  expect(movies[1].id, "m2");
  expect(movies[1].name, "White Chicks");
  expect(movies[1].price, 10.99);
}
