import 'dart:math';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import 'package:ser_manos/design_system/tokens/SerManosError.dart';
import 'package:ser_manos/design_system/tokens/SerManosLoading.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/shadows/shadows.dart';
import 'package:ser_manos/logger/logger.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/model/Volunteering.dart';
import 'package:ser_manos/model/VolunteeringPostulation.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/providers/Notifier/Volunteering/VolunteeringList.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityCard extends ConsumerWidget {
  const ActivityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ApplicationUser? user = ref.watch(currentUserProvider);
    VolunteeringPostulation? postulation = user?.postulation;
    if (postulation == null) {
      return const SizedBox();
    }
    final service = ref.watch(
        getVolunteeringByIdProvider(id: postulation.volunteeringId.toString()));
    return service.when(
        error: (_, s) => const SerManosError(),
        loading: () => const SerManosLoading(),
        data: (volunteeringInformation) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Tu actividad',
                style: SermanosTypography.headline01(),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => {
                  context.beamToNamed(
                      '/volunteering/${postulation.volunteeringId}')
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: SermanosColors.primary5,
                    border: Border.all(
                      color: SermanosColors.primary100,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: SermanosShadows.shadow2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            volunteeringInformation!.category.toUpperCase(),
                            style: const SermanosTypography.overline(
                              color: SermanosColors.neutral75,
                            ),
                          ),
                          Text(
                            volunteeringInformation.name,
                            style: const SermanosTypography.subtitle01(),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          double lat = volunteeringInformation.lat;
                          double long = volunteeringInformation.long;
                          String googleMapsUrl =
                              "https://www.google.com/maps/search/?api=1&query=$lat,$long";
                          launch(googleMapsUrl);
                        },
                        child: SermanosIcons.locationFilled(
                          status: SermanosIconStatus.activated,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        });
  }
}
