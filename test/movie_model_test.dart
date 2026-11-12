
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie Model Tests', () {

    test('Movie properties are assigned correctly', () {
      const Movie movie = Movie(
        id: 'm1',
        name: 'Haunted Heist 2026',
        description: 'A supernatural heist.',
        ageRating: 'PG',
        price: 10.99,
        imagePath: 'assets/images/haunted_heist.jpg',
        screeningTime: '18:00',
      );

      expect(movie.id, 'm1');
      expect(movie.name, 'Haunted Heist 2026');
      expect(movie.description, 'A supernatural heist.');
      expect(movie.ageRating, 'PG');
      expect(movie.price, 10.99);
      expect(movie.imagePath, 'assets/images/haunted_heist.jpg');
      expect(movie.screeningTime, '18:00');
    });

    test('Movie JSON conversion works correctly', () {
      final Map<String, dynamic> data = <String, dynamic>{
        'id': 'm1',
        'name': 'Haunted Heist 2026',
        'description': 'A supernatural heist.',
        'ageRating': 'PG',
        'price': 10.99,
        'imagePath': 'assets/images/haunted_heist.jpg',
        'screeningTime': '18:00',
      };

      final Movie movie = Movie.fromJson(data);

      expect(movie.id, 'm1');
      expect(movie.name, 'Haunted Heist 2026');
      expect(movie.description, 'A supernatural heist.');
      expect(movie.ageRating, 'PG');
      expect(movie.price, 10.99);
      expect(movie.imagePath, 'assets/images/haunted_heist.jpg');
      expect(movie.screeningTime, '18:00');

      expect(movie.toJson(), data);
    });

    test('Movie fromJson converts whole-number prices to double', () {
      final Map<String, dynamic> data = <String, dynamic>{
        'id': 'm2',
        'name': 'White Chicks',
        'description': 'A comedy film.',
        'ageRating': '12',
        'price': 15,
        'imagePath': 'assets/images/white_chicks.jpg',
        'screeningTime': '20:00',
      };

      final Movie movie = Movie.fromJson(data);

      expect(movie.price, 15.0);
      expect(movie.price, isA<double>());
    });

  });
}
