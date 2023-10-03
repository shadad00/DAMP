import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/cards/InformationCards/InformationCard.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/molecules/components/profile_image.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/model/User.dart';

class ProfileInformationScreen extends StatelessWidget {
  final ApplicationUser user; 

  const ProfileInformationScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          ProfileImage(imageUrl: user.profileImageUrl),
          const Text("Voluntario",
              style:
                  SermanosTypography.overline(color: SermanosColors.neutral75)),
          Text('${user.name} ${user.surname}',
              style: const SermanosTypography.subtitle01(
                  color: SermanosColors.neutral75)),
          Text(user.email,
              style: const SermanosTypography.body01(
                  color: SermanosColors.secondary200)),
          const SizedBox(height: 16),
          InformationCard(
              title: "Información personal",
              firsTitle: "FECHA DE NACIMIENTO",
              firstSubtitle: user.birthdate.toString(),
              secondTitle: "GÈNERO",
              secondSubtitle: user.gender!.text),
          const SizedBox(height: 16),
          InformationCard(
              title: "Datos de contacto",
              firsTitle: "TELÈFONO",
              firstSubtitle: user.phone!,
              secondTitle: "E-MAIL",
              secondSubtitle: user.email),
          const SizedBox(height: 16),
          CtaButton(
              text: "Editar Perfil",
              onPressed: () => context.beamToNamed("/profile/edit"),
              filled: true),
          const SizedBox(height: 8),
          CtaButton(text: "Cerrar Sesión", onPressed: () {}, filled: false)
        ],
      ),
    );
  }
}
