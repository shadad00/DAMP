import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/screens/MainScreen.dart';
import 'package:ser_manos/screens/MyProfile/EditProfileScreen.dart';

class ProfileLocation extends BeamLocation<BeamState> {
  ProfileLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => ["/profile", "/profile/edit"];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pageStack = [
      const BeamPage(
        key: ValueKey("profile"),
        name: "profile",
        child: MainScreen(),
      )
    ];

    if (state.pathPatternSegments.contains("edit")) {
      pageStack.add(const BeamPage(
          key: ValueKey("edit-profile"),
          name: "edit-profile",
          child: EditProfileScreen()));
    }

    return pageStack;
  }
}
