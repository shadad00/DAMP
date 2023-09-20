import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/atoms/icons/logo.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

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
              Text(
                  "El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros",
                  textAlign: TextAlign.center,
                  style: SermanosTypography.subtitle01(
                      color: SermanosColors.neutral100))
            ]),
            Column(
              children: [
                CtaButton(
                    text: "Iniciar Sesión", onPressed: () {}, filled: true),
                CtaButton(
                  text: "Registrarse",
                  onPressed: () {},
                  filled: false,
                  textColor: SermanosColors.primary100,
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
