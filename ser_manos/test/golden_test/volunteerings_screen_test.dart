import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';
import 'package:ser_manos/providers/Notifier/Volunteering/VolunteeringList.dart';
import 'package:ser_manos/screens/Home/VolunteeringListScreen.dart';
import 'package:ser_manos/screens/Home/VolunteeringScreen.dart';

import 'mocks/volunteering_screen_providers.dart';



void main() {
  testWidgets(
    'Volunteering List Screen',
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
              getVolunteeringsProvider
                  .overrideWith((ref) => getVolunteeringsMock(ref)),
              searchQueryProvider.overrideWith((ref) => ''),
              volunteeringListProvider
                  .overrideWith(() => VolunteeringListMock())
            ],
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: Material(child: VolunteeringListScreen()),
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(VolunteeringListScreen),
        matchesGoldenFile('./images/postulate_list_view.png'),
      );
    },
  );
}
