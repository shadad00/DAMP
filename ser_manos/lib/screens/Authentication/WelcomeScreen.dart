import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/atoms/icons/logo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // todo: add the status bar.
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        color: SermanosColors.neutral0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(children: [
              SermanosLogos.square(logoUrl: "assets/images/SquareLogo.png"),
              SizedBox(
                height: 30,
              ),
              Text("¡Bienvenido!",
                  textAlign: TextAlign.center,
                  style: SermanosTypography.headline01(
                      color: SermanosColors.neutral100)),
              SizedBox(
                height: 48,
              ),
              Text(
                  "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
                  textAlign: TextAlign.center,
                  style: SermanosTypography.subtitle01(
                      color: SermanosColors.neutral100))
            ]),
            Column(
              children: [
                CtaButton(text: "Comenzar", onPressed: () => context.beamToNamed("/volunteering"), filled: true),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
