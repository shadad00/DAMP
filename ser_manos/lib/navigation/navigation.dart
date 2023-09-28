import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/navigation/Locations/NewsLocation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/navigation/Locations/ProfileLocation.dart';
import 'package:ser_manos/navigation/Locations/VolunteeringLocation.dart';
import 'package:ser_manos/navigation/Locations/loginLocation.dart';
import 'package:ser_manos/navigation/Locations/registerLocation.dart';
import 'package:ser_manos/providers/authentication/AuthProviders.dart';

final BeamerDelegate delegate = BeamerDelegate(
  guards: [
    BeamGuard(
        pathPatterns: ["/login", "/register"],
        guardNonMatching: true,
        check: (context, location) => true,
        beamToNamed: (origin, target) => "/login")
  ],
  locationBuilder: _locationBuilder,
  initialPath: "/volunteering",
);

BeamLocation<RouteInformationSerializable<dynamic>> _locationBuilder(
  RouteInformation routeInformation,
  BeamParameters? beamParameters,
) {
  if (routeInformation.location!.contains("/profile")) {
    return ProfileLocation(routeInformation);
  }
  if (routeInformation.location!.contains("/news")) {
    return NewsLocation(routeInformation);
  }
  if (routeInformation.location!.contains("/login")) {
    return LoginLocation(routeInformation);
  }
  if (routeInformation.location!.contains("/register")) {
    return RegisterLocation(routeInformation);
  }
  return VolunteeringLocation(routeInformation);
}

class AuthGuard extends BeamGuard {
  AuthGuard({
    required Ref providerRef,
  }) : super(
          pathPatterns: ["/login", "/register"],
          guardNonMatching: true,
          beamToNamed: (origin, target) => "/login",
          check: (context, location) => providerRef.read(firebaseAuthProvider).currentUser != null,
        );
}
