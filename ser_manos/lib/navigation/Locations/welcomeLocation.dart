import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/screens/Authentication/WelcomeScreen.dart';

class WelcomeLocation extends BeamLocation<BeamState> {
  WelcomeLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => ["/welcome"];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey("welcome"),
        name: "welcome",
        child: WelcomeScreen(),
      )
    ];
  }
}
