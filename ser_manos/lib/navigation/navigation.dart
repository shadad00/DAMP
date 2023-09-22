import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/navigation/Locations/NewsLocation.dart';
import 'package:ser_manos/navigation/Locations/ProfileLocation.dart';
import 'package:ser_manos/navigation/Locations/VolunteeringLocation.dart';
import 'package:ser_manos/screens/Authentication/WelcomeScreen.dart';

final BeamerDelegate delegate = BeamerDelegate(
  initialPath : "/volunteering",
  locationBuilder: _locationBuilder
  ); 


BeamLocation<RouteInformationSerializable<dynamic>> _locationBuilder(
  RouteInformation routeInformation,
  BeamParameters? beamParameters,
) {
  if (routeInformation.location!.contains("/voluteering")) {
    return VolunteeringLocation(routeInformation);
  }
  if (routeInformation.location!.contains("/profile")) {
    return ProfileLocation(routeInformation);
  }
  if (routeInformation.location!.contains("/news")) {
    return NewsLocation(routeInformation);
  }

  return VolunteeringLocation(routeInformation); 
}
