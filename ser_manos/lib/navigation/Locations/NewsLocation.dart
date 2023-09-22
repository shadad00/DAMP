import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/screens/News/NewDescriptionScreen.dart';
import 'package:ser_manos/screens/News/NewsScreen.dart';

class NewsLocation extends BeamLocation<BeamState> {
  NewsLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
        "/news",
        "/news/:id",
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pageStack = [
      const BeamPage(
        key: ValueKey("news"),
        title: "news",
        child: NewsScreen(),
      )
    ];

    if (state.pathParameters.containsKey('id')) {
      String id = state.pathParameters["id"]!;
      pageStack.add(
        BeamPage(
          key: ValueKey('news-$id'),
          title: 'news $id',
          child: const NewDescriptionScreen(),
        ),
      );
    }

    return pageStack;
  }
}
