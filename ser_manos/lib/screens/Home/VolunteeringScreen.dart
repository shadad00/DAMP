import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/design_system/cells/cards/VolunteeringCards/VolunteeringCard.dart';
import 'package:ser_manos/design_system/molecules/inputs/SermanosSearchBar.dart';
import 'package:ser_manos/design_system/tokens/SerManosError.dart';
import 'package:ser_manos/design_system/tokens/SerManosLoading.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';
import 'package:ser_manos/providers/Notifier/Volunteering/VolunteeringList.dart';

import '../../model/Volunteering.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

class VolunteeringScreen extends ConsumerWidget {
  const VolunteeringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(getVolunteeringsProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final List<int>? volunteeringList = ref.watch(volunteeringListProvider); 


    return service.when(
        data: (data) {
          final List<Volunteering> filteredData = [];
          for (var eachVolunteering in data) {
            if (eachVolunteering.name
                .toString()
                .toLowerCase()
                .contains(searchQuery.toLowerCase())) {
              filteredData.add(eachVolunteering);
            }
          }

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                SermanosSearchBar(
                  initialValue: searchQuery,
                  onChanged: (value) =>
                      {ref.read(searchQueryProvider.notifier).state = value},
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
                filteredData.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          return VolunteeringCard(
                              favorite: volunteeringList!= null && volunteeringList.contains(filteredData[index].id),
                              volunteeringInformation: filteredData[index]);
                        },
                      ))
                    : const Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                            child: Text("No se encontraron resultados.")),
                      )
              ],
            ),
          );
        },
        error: (error, stackTrace) => const SerManosError(),
        loading: () => const SerManosLoading());
  }
}
