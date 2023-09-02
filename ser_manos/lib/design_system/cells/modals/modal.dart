import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class Modal extends StatelessWidget {
  final String title;
  final String subtitle;
  final String confirm;
  final String cancel;
  final bool isLoading;
  const Modal(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.confirm,
      required this.cancel,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child:
      // TODO dialog?????
      Column(children: [
        Text(
          title,
          style: const SermanosTypography.subtitle01(),
        ),
        Text(
          subtitle,
          style: const SermanosTypography.headline02(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ShortButton(
                onPressed: () {
                  //TODO
                },
                text: confirm),
            ShortButton(
                onPressed: () {
                  //TODO
                },
                text: cancel),
          ],
        )
      ]),
    );
  }
}
