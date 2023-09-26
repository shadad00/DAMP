import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/screens/Authentication/LoginScreen.dart';
import 'package:ser_manos/screens/Authentication/RegisterScreen.dart';

class RegisterLocation extends BeamLocation<BeamState> {
  RegisterLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => ["/register"];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey("register"),
        name: "register",
        child: RegisterScreen(),
      )
    ];
  }
}
