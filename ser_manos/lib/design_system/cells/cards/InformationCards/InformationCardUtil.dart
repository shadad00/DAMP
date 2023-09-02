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
    return Column(
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
    ]); 
  }
}
