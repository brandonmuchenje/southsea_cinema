import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_screen.dart';

const Movie testMovie = Movie(
  id: 'm1',
  name: 'Haunted Heists 2026',
  description: 'Test movie',
  ageRating: 'PG',
  price: 10.99,
  imagePath: 'assets/images/oip.jpg',
  screeningTime: 'Thursday 22 Oct 2026 18:00',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  testWidgets(
    'BasketScreen displays empty message when basket has no items',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BasketScreen(),
        ),
      );

      expect(
        find.text('Your basket is empty'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'BasketScreen displays basket items',
    (WidgetTester tester) async {
      const CartItem item = CartItem(
        movie: testMovie,
        quantity: 2,
      );

      BasketRepository.instance.addItem(item);

      await tester.pumpWidget(
        const MaterialApp(
          home: BasketScreen(),
        ),
      );

      expect(
        find.text('My Basket'),
        findsOneWidget,
      );

      expect(
        find.text('Haunted Heists 2026'),
        findsOneWidget,
      );

      expect(
        find.text('2 ticket(s)'),
        findsOneWidget,
      );

      expect(
        find.text('£21.98'),
        findsOneWidget,
      );
    },
  );
}