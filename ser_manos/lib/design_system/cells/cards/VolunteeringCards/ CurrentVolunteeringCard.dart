import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/shadows/shadows.dart';
import 'package:ser_manos/model/Volunteering.dart';

class CurrentVolunteeringCard extends StatelessWidget {
  final Volunteering volunteeringInformation;

  const CurrentVolunteeringCard(
      {super.key, required this.volunteeringInformation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: SermanosColors.primary100, width: 2),
        boxShadow: SermanosShadows.shadow2,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
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
              )
            ],
          ),
          InkWell(
            onTap: () => {},
            child: SermanosIcons.locationFilled(
              status: SermanosIconStatus.activated,
            ),
          ),
        ],
      ),
    );
  }
}
