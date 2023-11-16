import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import 'package:ser_manos/design_system/cells/cards/VolunteeringCards/VolunteeringCard.dart';
import 'package:ser_manos/design_system/molecules/buttons/floating_button.dart';
import 'package:ser_manos/design_system/molecules/inputs/SermanosSearchBar.dart';
import 'package:ser_manos/design_system/tokens/SerManosError.dart';
import 'package:ser_manos/design_system/tokens/SerManosLoading.dart';
import 'package:ser_manos/model/Volunteering.dart';
import 'package:ser_manos/providers/Future/location/CurrentPositionController.dart';
import 'package:ser_manos/providers/Future/location/LocationProvider.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';
import 'package:ser_manos/providers/Notifier/Volunteering/VolunteeringList.dart';
import 'package:ser_manos/screens/Home/FullMap.dart';
import 'package:ser_manos/screens/Home/VolunteeringScreen.dart';

class VolunteeringMapScreen extends ConsumerWidget {
  const VolunteeringMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(getVolunteeringsProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final List<int>? volunteeringList = ref.watch(volunteeringListProvider);

    return service.when(
        data: (data) {
          final List<Volunteering> filteredData = [];
          final String query = searchQuery.toLowerCase();
          for (var eachVolunteering in data) {
            if (eachVolunteering.name
                    .toString()
                    .toLowerCase()
                    .contains(query) ||
                eachVolunteering.description
                    .toString()
                    .toLowerCase()
                    .contains(query) ||
                eachVolunteering.about
                    .toString()
                    .toLowerCase()
                    .contains(query)) {
              filteredData.add(eachVolunteering);
            }
          }

          return Stack(
            children: [
              const Positioned.fill(
                child: FullMap(),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SermanosSearchBar(
                            initialValue: searchQuery,
                            onChanged: (value) => {
                              ref.read(searchQueryProvider.notifier).state =
                                  value
                            },
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: FloatingButton(
                                  icon: SermanosIcons.nearMeFilled(
                                      status: SermanosIconStatus.activated),
                                  onPressed: () => {
                                        ref
                                            .read(
                                                currentPositionControllerProvider
                                                    .notifier)
                                            .set(ref
                                                .read(getUserPositionProvider)
                                                .value!)
                                      }),
                            )

                            // IconButton(
                            //   icon: SermanosIcons.nearMeFilled(
                            //     status: SermanosIconStatus.activated,
                            //   ),
                            //   onPressed: () => {
                            //     ref
                            //         .read(currentPositionControllerProvider
                            //             .notifier)
                            //         .set(ref.read(getUserPositionProvider).value!)
                            //   },
                            // ),
                            ),
                        // const SizedBox(height: 16),
                        filteredData.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text("No se encontraron resultados."),
                                ),
                              )
                            : Flexible(
                                child: CarouselSlider.builder(
                                  options: CarouselOptions(
                                    height: 259,
                                    enableInfiniteScroll: false,
                                    initialPage: 0,
                                    onPageChanged: (index, _) => {
                                      ref
                                          .read(
                                              currentPositionControllerProvider
                                                  .notifier)
                                          .set(LatLng(filteredData[index].lat,
                                              filteredData[index].long))
                                    },
                                  ),
                                  itemCount: filteredData.length,
                                  itemBuilder: (context, index, pageViewIndex) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: VolunteeringCard(
                                        favorite: volunteeringList != null &&
                                            volunteeringList.contains(
                                                filteredData[index].id),
                                        volunteeringInformation:
                                            filteredData[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) => const SerManosError(),
        loading: () => const SerManosLoading());
  }
}
