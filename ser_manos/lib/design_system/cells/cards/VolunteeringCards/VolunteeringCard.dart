import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import 'package:ser_manos/design_system/molecules/components/vacancies.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/shadows/shadows.dart';
import 'package:ser_manos/model/Volunteering.dart';
import '../../../tokens/colours/colours.dart';
import 'package:ser_manos/design_system/utils/NetworkImageWrapper.dart';

class VolunteeringCard extends StatelessWidget {
  final Volunteering volunteeringInformation;

  const VolunteeringCard({super.key, required this.volunteeringInformation});

  @override
  Widget build(BuildContext context) {
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
                        SermanosIcons.favoriteFilled(
                          // todo: view if the voluteering is one of the user's favourite.
                          status: SermanosIconStatus.activated,
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
