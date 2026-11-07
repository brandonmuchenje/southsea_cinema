import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:southsea_cinema/views/basket_screen.dart';
import 'package:southsea_cinema/views/menu_screen.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  testWidgets(
    'MenuScreen shows movie cards and basket button',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MenuScreen(),
        ),
      );

      expect(find.byType(MovieCard), findsWidgets);
      expect(find.byIcon(Icons.shopping_basket), findsOneWidget);
    },
  );

  testWidgets(
    'Tapping basket button navigates to BasketScreen',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const MenuScreen(),
            '/basket': (context) => const BasketScreen(),
          },
        ),
      );

      await tester.tap(
        find.byIcon(Icons.shopping_basket),
      );

      await tester.pumpAndSettle();

      expect(
        find.byType(BasketScreen),
        findsOneWidget,
      );
    },
  );
}