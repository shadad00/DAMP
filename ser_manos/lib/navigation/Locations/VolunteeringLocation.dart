import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/screens/Home/VolunteeringDescriptionScreen.dart';
import 'package:ser_manos/screens/MainScreen.dart';

class VolunteeringLocation extends BeamLocation<BeamState> {
  VolunteeringLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
        "/volunteering",
        '/volunteering/:id',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pageStack = [
      const BeamPage(
        key: ValueKey("volunteering"),
        title: "volunteering",
        child: MainScreen(),
      )
    ];

    if (state.pathParameters.containsKey('id')) {
      String id = state.pathParameters["id"]!;
      pageStack.add(
        BeamPage(
          key: ValueKey('volunteering-$id'),
          title: 'volunteering $id',
          child: const VolunteeringDescriptionScreen(volunteeringId: "1",),
        ),
      );
    }

    return pageStack;
  }
}
