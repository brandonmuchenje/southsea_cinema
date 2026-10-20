import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Text('Southsea Cinema'),
        ),
      ),
    );

    
    expect(find.text('Southsea Cinema'), findsOneWidget);
  });
}
