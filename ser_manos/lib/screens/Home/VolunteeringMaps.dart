import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/Volunteering.dart';

class VolunteeringMaps extends HookConsumerWidget {
  const VolunteeringMaps({
    Key? key,
    required this.volunteering,
  }) : super(key: key);

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(volunteering.lat, volunteering.long),
        zoom: 15,
      ),
      markers: <Marker>{
        Marker(
          markerId: MarkerId(volunteering.id.toString()),
          onTap: () {},
          position: LatLng(
            volunteering.lat,
            volunteering.long,
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      },
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}