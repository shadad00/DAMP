import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/screens/Authentication/LoginScreen.dart';

class LoginLocation extends BeamLocation<BeamState> {
  LoginLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => ["/login"];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey("login"),
        name: "login",
        child: LoginScreen(),
      )
    ];
  }
}
