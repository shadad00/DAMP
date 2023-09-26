import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/navigation/Locations/NewsLocation.dart';
import 'package:ser_manos/navigation/Locations/ProfileLocation.dart';
import 'package:ser_manos/navigation/Locations/VolunteeringLocation.dart';
import 'package:ser_manos/navigation/Locations/loginLocation.dart';
import 'package:ser_manos/navigation/Locations/registerLocation.dart';

final BeamerDelegate delegate = BeamerDelegate(
  guards: [BeamGuard(
    pathPatterns: ["/login","/register"] ,
    guardNonMatching: true,
    check: (context, location) => false,
    beamToNamed: (origin, target) => "/login"
  )],
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
