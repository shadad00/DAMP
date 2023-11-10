import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/logger/logger.dart';
import 'package:ser_manos/navigation/Locations/NewsLocation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/navigation/Locations/ProfileLocation.dart';
import 'package:ser_manos/navigation/Locations/VolunteeringLocation.dart';
import 'package:ser_manos/navigation/Locations/loginLocation.dart';
import 'package:ser_manos/navigation/Locations/registerLocation.dart';
import 'package:ser_manos/navigation/Locations/welcomeLocation.dart';

import '../providers/Notifier/Authentication/UserProvider.dart';

part 'generated/navigation.g.dart';
final BeamGuard routerLogger = BeamGuard(
    pathPatterns: ['*'],
    check: (context, location) {
      logger.d("Beamer: ${location.state.routeInformation.location}");
      return true;
    });

@Riverpod(keepAlive: true)
BeamerDelegate delegate(Ref ref) {
  return BeamerDelegate(
    guards: [AuthGuard(providerRef: ref), routerLogger],
    locationBuilder: _locationBuilder,
    initialPath: "/volunteering",
  );
}

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
  if (routeInformation.location!.contains("/welcome")) {
    return WelcomeLocation(routeInformation);
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
          check: (context, location) =>
              providerRef.watch(currentUserProvider.notifier).isLoggedIn(),
        );
}
