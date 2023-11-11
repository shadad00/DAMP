import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/Future/location/LocationProvider.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';

part 'generated/CurrentPositionController.g.dart';

@Riverpod()
class CurrentPositionController extends _$CurrentPositionController {
  @override
  FutureOr<LatLng> build() async {
    final nearestVolunteering = await ref
        .watch(getVolunteeringsProvider.selectAsync((value) => value.firstOrNull));
    final userPosition = await ref.refresh(getUserPositionProvider.future);
    if (nearestVolunteering == null) {
      return userPosition;
    }
    return LatLng(nearestVolunteering.lat, nearestVolunteering.long);
  }

  void set(LatLng value) {
    state = AsyncData(value);
  }
}
