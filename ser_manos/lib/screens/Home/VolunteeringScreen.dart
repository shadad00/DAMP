import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/design_system/cells/cards/VolunteeringCards/VolunteeringCard.dart';
import 'package:ser_manos/design_system/molecules/inputs/SermanosSearchBar.dart';
import 'package:ser_manos/design_system/tokens/SerManosLoading.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';

class VolunteeringScreen extends ConsumerWidget {
  const VolunteeringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(getVolunteeringsProvider);

    return service.when(
        data: (data) => Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  SermanosSearchBar(
                    onChanged: (p0) => {},
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text("Voluntariados",
                      style: SermanosTypography.headline01(
                          color: SermanosColors.neutral100)),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return VolunteeringCard(
                          volunteeringInformation: data[index]);
                    },
                  ))
                ],
              ),
            ),
        error: (error, stackTrace) => const Text("error"),
        loading: () => const SerManosLoading());
  }
}
