import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/design_system/tokens/SerManosError.dart';
import 'package:ser_manos/design_system/tokens/SerManosLoading.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/model/Volunteering.dart';
import 'package:ser_manos/providers/Future/location/LocationProvider.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';


class FullMap extends HookConsumerWidget {
  const FullMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final focusedCoordinate = ref.watch(focusedCoordinateControllerProvider);

    final volunteerings =
        ref.watch(getVolunteeringsProvider).value!;

    final mapController = useState<GoogleMapController?>(null);

    // if (mapController.value != null) {
    //   mapController.value!.animateCamera(
    //     CameraUpdate.newCameraPosition(
    //       CameraPosition(
    //         target: focusedCoordinate.value!,
    //         zoom: 15,
    //       ),
    //     ),
    //   );
    // }

    // return focusedCoordinate.when(
    //   skipLoadingOnReload: true,
    //   data: (coordinates) => GoogleMap(
    //     initialCameraPosition: CameraPosition(
    //       target: coordinates,
    //       zoom: 15,
    //     ),
    //     markers: _volunteeringToMarkers(volunteerings),
    //     circles: _userCoordinatesCircle(
    //       ref.read(getUserPositionProvider).value!,
    //     ),
    //     myLocationButtonEnabled: false,
    //     zoomControlsEnabled: false,
    //     onMapCreated: (GoogleMapController controller) {
    //       mapController.value = controller;
    //     },
    //   ),
    //   error: (_, __) => const Align(
    //     alignment: Alignment.center,
    //     child: SerManosError(),
    //   ),
    //   loading: () => const SerManosLoading(),
    // );
    return GoogleMap(
        initialCameraPosition: CameraPosition(
          target: ref.read(getUserPositionProvider).value!,
          zoom: 15,
        ),
        markers: _volunteeringToMarkers(volunteerings),
        circles: _userCoordinatesCircle(
          ref.read(getUserPositionProvider).value!,
        ),
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          mapController.value = controller;
        },
      );
  }

  Set<Marker> _volunteeringToMarkers(
    List<Volunteering> volunteerings,
  ) {
    Set<Marker> markers = {};

    for (Volunteering volunteering in volunteerings) {
      markers.add(
        Marker(
          markerId: MarkerId(volunteering.id.toString()),
          onTap: () {},
          position: LatLng(
            volunteering.lat,
            volunteering.long,
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }
    return markers;
  }

  Set<Circle> _userCoordinatesCircle(
    LatLng userCoordinates,
  ) {
    return {
      Circle(
        circleId: const CircleId("user_coordinates1"),
        radius: 40,
        strokeWidth: 1,
        zIndex: 10,
        fillColor: SermanosColors.neutral0,
        strokeColor: SermanosColors.secondary200,
        center: userCoordinates,
      ),
      Circle(
        circleId: const CircleId("user_coordinates2"),
        radius: 30,
        strokeWidth: 1,
        zIndex: 50,
        fillColor: SermanosColors.secondary200,
        strokeColor: SermanosColors.secondary200,
        center: userCoordinates,
      ),
    };
  }
}