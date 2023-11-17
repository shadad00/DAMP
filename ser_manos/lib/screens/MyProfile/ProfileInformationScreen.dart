import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/cells/cards/InformationCards/InformationCard.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/molecules/components/profile_image.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/providers/Providers/Providers.dart';

class ProfileInformationScreen extends ConsumerWidget {
  const ProfileInformationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ApplicationUser? user = ref.watch(currentUserProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileImage(imageUrl: user!.profileImageUrl,  height: 110, width: 110),
            const SizedBox(height: 16),
            const Text("VOLUNTARIO",
                style:
                    SermanosTypography.overline(color: SermanosColors.neutral75)),
            Text('${user.name} ${user.surname}',
                style: const SermanosTypography.subtitle01(
                    color: SermanosColors.neutral75)),
            Text(user.email,
                style: const SermanosTypography.body01(
                    color: SermanosColors.secondary200)),
            const SizedBox(height: 32),
            InformationCard(
                title: "Información personal",
                firsTitle: "FECHA DE NACIMIENTO",
                firstSubtitle:
                    "${user.birthdate!.day.toString().padLeft(2, '0')}/${user.birthdate!.month.toString().padLeft(2, '0')}/${user.birthdate!.year}",
                secondTitle: "GÈNERO",
                secondSubtitle: user.gender!.text),
            const SizedBox(height: 32),
            InformationCard(
                title: "Datos de contacto",
                firsTitle: "TELÈFONO",
                firstSubtitle: user.phone!,
                secondTitle: "E-MAIL",
                secondSubtitle: user.emailContact == null
                    ? "No especificado"
                    : user.emailContact!),
            const SizedBox(height: 32),
            CtaButton(
                text: "Editar Perfil",
                onPressed: () => context.beamToNamed("/profile/edit"),
                filled: true),
            const SizedBox(height: 8),
            CtaButton(
                textColor: SermanosColors.error100,
                text: "Cerrar Sesión",
                onPressed: () {
                  ref.read(authServiceProvider).signOut();
                  context.beamToNamed("/login");
                },
                filled: false)
          ],
        ),
      ),
    );
  }
}
