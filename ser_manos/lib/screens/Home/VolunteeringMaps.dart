import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

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

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                topLeft: Radius.circular(4),
              ),
              color: SermanosColors.secondary25,
            ),
            width: double.infinity,
            child: const Text(
              "Ubicación",
              style: SermanosTypography.subtitle01(
                  color: SermanosColors.neutral100),
            ),
          ),
          SizedBox(
            height: 200,
            child: GoogleMap(
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
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4)),
              color: SermanosColors.neutral10,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "DIRECCIÓN",
                  style: SermanosTypography.overline(
                    color: SermanosColors.neutral75,
                  ),
                ),
                Text(
                  volunteering.address,
                  style: const SermanosTypography.body01(
                    color: SermanosColors.neutral100,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    // return
  }
}
