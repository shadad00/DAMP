import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/design_system/tokens/SerManosError.dart';
import 'package:ser_manos/design_system/tokens/SerManosLoading.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/model/Volunteering.dart';
import 'package:ser_manos/providers/Future/location/CurrentPositionController.dart';
import 'package:ser_manos/providers/Future/location/LocationProvider.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';


class FullMap extends HookConsumerWidget {
  const FullMap({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPosition = ref.watch(currentPositionControllerProvider);

    final volunteerings =
        ref.watch(getVolunteeringsProvider).value!;

    final mapController = useState<GoogleMapController?>(null);

    if (mapController.value != null) {
      mapController.value!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: currentPosition.value!,
            zoom: 15,
          ),
        ),
      );
    }

    return currentPosition.when(
      skipLoadingOnReload: true,
      data: (coordinates) => GoogleMap(
        initialCameraPosition: CameraPosition(
          target: coordinates,
          zoom: 15,
        ),
        markers: mapsMarkers(volunteerings),
        circles: userPosition(
          ref.read(getUserPositionProvider).value!,
        ),
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          mapController.value = controller;
        },
      ),
      error: (_, __) => const Align(
        alignment: Alignment.center,
        child: SerManosError(),
      ),
      loading: () => const SerManosLoading(),
    );
  }

  Set<Marker> mapsMarkers(
    List<Volunteering> volunteerings,
  ) {
    Set<Marker> markers = {};

    for (Volunteering volunteering in volunteerings) {
      markers.add(
        Marker(
          markerId: MarkerId(volunteering.id.toString()),
          onTap: () {
            // TODO: move the carrousel
          },
          position: LatLng(
            volunteering.lat,
            volunteering.long,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(210.0),
        ),
      );
    }
    return markers;
  }

  Set<Circle> userPosition(
    LatLng userCoordinates,
  ) {
    return {
      Circle(
        circleId: const CircleId("user_coordinates1"),
        radius: 48,
        strokeWidth: 1,
        zIndex: 10,
        fillColor: SermanosColors.neutral0,
        strokeColor: SermanosColors.neutral0,
        center: userCoordinates,
      ),
      Circle(
        circleId: const CircleId("user_coordinates2"),
        radius: 32,
        strokeWidth: 1,
        zIndex: 50,
        fillColor: SermanosColors.secondary90,
        strokeColor: SermanosColors.secondary90,
        center: userCoordinates,
      ),
    };
  }
}