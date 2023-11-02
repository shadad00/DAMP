import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import 'package:ser_manos/design_system/molecules/components/vacancies.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/shadows/shadows.dart';
import 'package:ser_manos/model/Volunteering.dart';
import 'package:ser_manos/providers/Notifier/Volunteering/VolunteeringList.dart';
import '../../../tokens/colours/colours.dart';
import 'package:ser_manos/design_system/utils/NetworkImageWrapper.dart';

class VolunteeringCard extends ConsumerWidget {
  final Volunteering volunteeringInformation;
  final bool favorite;

  const VolunteeringCard(
      {super.key,
      required this.volunteeringInformation,
      required this.favorite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () =>
          {context.beamToNamed('/volunteering/${volunteeringInformation.id}')},
      child: Container(
        decoration: BoxDecoration(
          color: SermanosColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: SermanosShadows.shadow2,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              NetworkImageWrapper(imageUrl: volunteeringInformation.imageUrl),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            volunteeringInformation.category.toUpperCase(),
                            style: const SermanosTypography.overline(
                              color: SermanosColors.neutral75,
                            ),
                          ),
                          Text(
                            volunteeringInformation.name,
                            style: const SermanosTypography.subtitle01(),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Vacancies(
                            vacancy: volunteeringInformation.capacity -
                                volunteeringInformation.volunteerQuantity,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            final volunteeringList = ref.read(volunteeringListProvider.notifier); 
                            if (favorite) { 
                                  volunteeringList.removeFavorite(volunteeringInformation.id);
                            } else {
                                  volunteeringList.addFavorite(volunteeringInformation.id);
                            }
                          },
                          child: favorite
                              ? SermanosIcons.favoriteFilled(
                                  status: SermanosIconStatus.activated,
                                )
                              : SermanosIcons.favoriteOutlined(
                                  status: SermanosIconStatus.activated,
                                ),
                        ),
                        const SizedBox(width: 23),
                        InkWell(
                          onTap: () => {},
                          child: SermanosIcons.locationFilled(
                            status: SermanosIconStatus.activated,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
