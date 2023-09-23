import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/screens/MainScreen.dart';
import 'package:ser_manos/screens/MyProfile/ProfileInformationScreen.dart';

class ProfileLocation extends BeamLocation<BeamState> {
  ProfileLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ["/profile"];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
          key: ValueKey("profile"),
          name: "profile",
          child: MainScreen()
        )
    ];
  }
}
