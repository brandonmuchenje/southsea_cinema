import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/views/basket_screen.dart';

const Movie testMovie = Movie(
  id: 'm1',
  name: 'Haunted Heists 2026',
  description: 'A scary movie about robbing a haunted house',
  ageRating: 'PG',
  price: 10.99,
  imagePath: 'assets/images/haunted_heist.jpg',
  screeningTime: 'Thursday 22 Oct 2026 18:00',
);

void main() {
  setUp(() {
    CartRepository.instance.clear();
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

      expect(
        find.text('Checkout'),
        findsNothing,
      );
    },
  );

  testWidgets(
    'BasketScreen renders items and removes item when delete pressed',
    (WidgetTester tester) async {
      const CartItem item = CartItem(
        movie: testMovie,
        quantity: 2,
      );

      CartRepository.instance.addItem(item);

      await tester.pumpWidget(
        const MaterialApp(
          home: BasketScreen(),
        ),
      );

      expect(
        find.text('Your Basket'),
        findsOneWidget,
      );

      expect(
        find.text('2 x Haunted Heists 2026'),
        findsOneWidget,
      );

      expect(
        find.text('£21.98'),
        findsWidgets,
      );

      expect(
        find.text('Checkout'),
        findsOneWidget,
      );

      await tester.tap(
        find.byIcon(Icons.delete_outline),
      );

      await tester.pump();

      expect(
        find.text('Your basket is empty'),
        findsOneWidget,
      );
    },
  );
}
