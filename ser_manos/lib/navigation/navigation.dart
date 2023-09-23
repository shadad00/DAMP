import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/navigation/Locations/NewsLocation.dart';
import 'package:ser_manos/navigation/Locations/ProfileLocation.dart';
import 'package:ser_manos/navigation/Locations/VolunteeringLocation.dart';

final BeamerDelegate delegate = BeamerDelegate(
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
    return VolunteeringLocation(routeInformation);
}
