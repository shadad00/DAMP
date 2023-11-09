import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/screens/MyProfile/ProfileInformationScreen.dart';
import 'mocks/profile_screen_provider.dart';




void main() {
  testWidgets(
    'Profile screen golden test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Localizations(
          locale: const Locale('en', 'US'),
          delegates: const <LocalizationsDelegate<dynamic>>[
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          child: ProviderScope(
            overrides: [
              currentUserProvider.overrideWith(() => CurrentUserMock())
            ],
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: Material(
                child: ProfileInformationScreen(),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(ProfileInformationScreen),
        matchesGoldenFile('./images/profile_information_screen.png'),
      );
    },
  );
}
