import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/Future/location/LocationProvider.dart';

part "generated/LocationProvider.g.dart";

@Riverpod(keepAlive: true)
Future<LatLng> getUserPosition(GetUserPositionRef ref) async {
  bool isLocationEnabled;

  isLocationEnabled = await Geolocator.isLocationServiceEnabled();
  if (!isLocationEnabled) {
    return Future.error('Esta deshabilitado el servicio de ubicacion.');
  }
  
  LocationPermission permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.denied){
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      return Future.error('No se otorgo permiso para acceder a la ubicacion.');
    }
  }

  final location = await Geolocator.getCurrentPosition();
  return LatLng(location.latitude, location.longitude);
}
