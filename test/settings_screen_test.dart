import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:southsea_cinema/models/user_settings.dart';
import 'package:southsea_cinema/views/settings_screen.dart';

void main() {
  group('UserSettings Tests', () {
    setUp(() {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.empty();
    });

    test('default values are assigned correctly', () {
      const settings = UserSettings();

      expect(settings.name, isEmpty);
      expect(settings.address, isEmpty);
      expect(settings.email, isEmpty);
      expect(settings.receiveNewsletter, isFalse);
    });

    testWidgets('SettingsScreen pre-fills saved settings on open', (
      WidgetTester tester,
    ) async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(<String, Object>{
        prefName: 'Alex Smith',
        prefAddress: '10 Elm Road, Portsmouth',
        prefEmail: 'alex@example.com',
        prefNewsletter: true,
      });


      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Alex Smith'), findsOneWidget);
      expect(find.text('10 Elm Road, Portsmouth'), findsOneWidget);
      expect(find.text('alex@example.com'), findsOneWidget);

      final Switch switchWidget =
          tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isTrue);
    });

    test('configured values are assigned correctly', () {
      const settings = UserSettings(
        name: 'Alex Smith',
        address: '10 Elm Road, Portsmouth',
        email: 'alex@example.com',
        receiveNewsletter: true,
      );

      expect(settings.name, 'Alex Smith');
      expect(settings.address, '10 Elm Road, Portsmouth');
      expect(settings.email, 'alex@example.com');
      expect(settings.receiveNewsletter, isTrue);
    });
  });
}