import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/model/News.dart';
import 'package:ser_manos/providers/Future/news/NewsProvider.dart';
import 'package:ser_manos/screens/News/NewsScreen.dart';

import '../mocked_list/list.dart';

Future<List<News>> getNewsMock(GetNewsRef ref) async {
  return newsList; 
}

void main() {
  testWidgets(
    'News Screen',
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
              getNewsProvider.overrideWith((ref) => getNewsMock(ref))
            ],
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: Material(
                child: NewsScreen(),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(NewsScreen),
        matchesGoldenFile('./images/news_screen.png'),
      );
    },
  );
}
