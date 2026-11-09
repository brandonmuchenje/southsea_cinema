import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/user_settings.dart';

void main() {
  group('UserSettings Tests', () {
    test('default values are assigned correctly', () {
      const settings = UserSettings();

      expect(settings.name, isEmpty);
      expect(settings.address, isEmpty);
      expect(settings.email, isEmpty);
      expect(settings.receiveNewsletter, isFalse);
    });

    test('configured values are assigned correctly', () {
      const settings = UserSettings(
        name: 'Jaden Smith',
        address: '123 Test Street',
        email: 'jaden@example.com',
        receiveNewsletter: true,
      );

      expect(
        settings.name,
        'Jaden Smith',
      );

      expect(
        settings.address,
        '123 Test Street',
      );

      expect(
        settings.email,
        'jaden@example.com',
      );

      expect(
        settings.receiveNewsletter,
        isTrue,
      );
    });
  });
}