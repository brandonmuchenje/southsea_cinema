import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('MovieRepository unit tests', () {
    test('getMovies returns  four movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 4);
    });

    test('LoadMovieFromAsset reads the bundled JSON ', () async {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movie = await repository.loadMovieFromAsset();

      expect(movie.length, 5);
      expect(movie[0].id, 'm1');
      expect(movie[1].id, 'm2');
      expect(movie[2].id, 'm3');
      expect(movie[3].id, 'm4');
      expect(movie[4].id, 'm5');
      expect(movie[4].name, 'Spiderman');
      expect(movie[4].price, 0.0);
      expect(movie[4].imagePath, 'assets/images/spiderman.jpg');
      expect(repository.getMovies(), movie);
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

      expect(movies[2].id, 'm3');
      expect(movies[2].name, 'Shrek');
      expect(movies[2].price, 10.99);
      expect(movies[2].imagePath, 'assets/images/shrek.jpg');

      expect(movies[3].id, 'm4');
      expect(movies[3].price, 10.99);
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
          .any((Movie movie) => movie.id == 'spiderman');

      expect(hasMovie, isFalse);
    });
  });
}