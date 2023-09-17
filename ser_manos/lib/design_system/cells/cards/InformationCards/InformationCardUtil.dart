import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class InformationCardUtil extends StatelessWidget {
  final String title;
  final String subtitle;

  const InformationCardUtil(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(Object context) {
    return Container(
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
        Text(
          title,
          style: const SermanosTypography.overline(
            color: SermanosColors.neutral75
          ),
          ),
        Text(
          subtitle,
          style: const SermanosTypography.body01(
            color: Colors.black
          ),)
    ]),
    ); 
  }
}
