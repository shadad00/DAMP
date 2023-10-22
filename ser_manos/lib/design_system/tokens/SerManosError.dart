import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class SerManosError extends StatelessWidget {
  const SerManosError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          size: 80,
          color: SermanosColors.error100,
        ),
        SizedBox(height: 10),
        Text("Algo salió mal, por favor intente de nuevo más tarde.",
            textAlign: TextAlign.center,
            style: SermanosTypography.body02(color: SermanosColors.neutral100)),
      ],
    );
  }
}