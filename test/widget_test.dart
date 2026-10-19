import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    
    await tester.pumpWidget(const MyApp());

    
    expect(find.text('Southsea Cinema'), findsOneWidget);
  });
}
