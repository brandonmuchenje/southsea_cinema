import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/screens/menu_screen.dart';

void main() {
  group('MovieCard widget tests', () {
    testWidgets('displays movie title correctly', (WidgetTester tester) async {
      const movie = Movie(
        id: 'm1',
        name: 'Haunted Heists 2026',
        description: 'A scary movie about robbing a haunted house',
        ageRating: 'PG',
        price: 10.99,
        imagePath: 'assets/images/oip.jpg',
        screeningTime: 'Thursday 22 Oct 2026 18:00',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MovieCard(movie: movie),
          ),
        ),
      );

      expect(find.text('Haunted Heists 2026'), findsOneWidget);
    });

    testWidgets('displays age rating and screening time',
        (WidgetTester tester) async {
      const movie = Movie(
        id: 'm1',
        name: 'Haunted Heists 2026',
        description: 'A scary movie about robbing a haunted house',
        ageRating: 'PG',
        price: 10.99,
        imagePath: 'assets/images/oip.jpg',
        screeningTime: 'Thursday 22 Oct 2026 18:00',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MovieCard(movie: movie),
          ),
        ),
      );

      expect(find.text('PG'), findsOneWidget);
      expect(find.text('Thursday 22 Oct 2026 18:00'), findsOneWidget);
    });
  });

  group('App smoke tests', () {
    testWidgets('App displays MenuScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: MenuScreen()));
      expect(find.byType(MenuScreen), findsOneWidget);
      expect(find.text('Southsea Cinema'), findsOneWidget);
    });

    testWidgets('Displays movie cards with names and prices',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: MenuScreen()));

      expect(find.text('Haunted Heists 2026'), findsOneWidget);
      expect(find.text('£10.99'), findsOneWidget);

      expect(find.text('White Chicks'), findsOneWidget);
      expect(find.text('£10.99'), findsOneWidget);

      expect(find.text('Book Now'), findsNWidgets(2));
    });

    testWidgets(
        'Tapping Book Now navigates to MovieListing with selected movie',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: MenuScreen()));

      await tester.tap(find.text('Book Now').first);
      await tester.pumpAndSettle();

      expect(find.text('Haunted Heists 2026'), findsOneWidget);
      expect(find.text('Thursday 22 Oct 2026 18:00'), findsOneWidget);
    });

    testWidgets('Selecting tickets and tapping add updates feedback',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: MenuScreen()));

      await tester.tap(find.text('Book Now').first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('1 Ticket'));
      await tester.pump();

      await tester.tap(find.text('add'));
      await tester.pump();

      expect(find.text('1 ticket(s) added (£10.99)'), findsOneWidget);
    });
  });
}
