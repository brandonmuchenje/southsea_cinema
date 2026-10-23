import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie Model Tests', () {
    test('Movie properties are assigned correctly', () {
      const movie = Movie(
        id: 'm1',
        name: 'Haunted Heist 2026',
        description: 'A supernatural heist.',
        ageRating: "PG",
        price: 10.99,
        imagePath: 'assets/OIP.jpg',
        screeningTime: 'Thursday 22 Oct 2026 18:00',
      );

      expect(movie.id, 'm1');
      expect(movie.name, 'Haunted Heist 2026');
      expect(movie.price, 10.99);
    });

    test('formattedPrice correctly formats prices with pence and whole pounds',
        () {
      const movieWithPence = Movie(
        id: 'm1',
        name: 'Haunted Heist 2026',
        description: 'A supernatural heist.',
        ageRating: "PG",
        price: 10.99,
        imagePath: 'assets/OIP.jpg',
        screeningTime: 'Thursday 22 Oct 2026 18:00',
      );

      const movieWholePounds = Movie(
        id: 'm2',
        name: 'White Chicks',
        description: 'Undercover FBI agents.',
        ageRating: 'PG',
        price: 10.99,
        imagePath: 'assets/images/white_chicks.jpg',
        screeningTime: 'Friday 23 Oct 2026 20:00',
      );

      expect(movieWithPence.formattedPrice, '£10.99');
      expect(movieWholePounds.formattedPrice, '£10.99');
    });
  });
}
