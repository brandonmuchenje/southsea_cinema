import 'package:flutter_test/flutter_test.dart';

import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie1 = Movie(
  id: 'm1',
  name: 'Movie One',
  description: 'Test movie',
  ageRating: 'PG',
  price: 10.0,
  imagePath: 'assets/images/test.jpg',
  screeningTime: 'Thursday 18:00',
);

const Movie testMovie2 = Movie(
  id: 'm2',
  name: 'Movie Two',
  description: 'Test movie',
  ageRating: '15',
  price: 6.0,
  imagePath: 'assets/images/test2.jpg',
  screeningTime: 'Friday 20:00',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository Tests', () {
    
  });
}