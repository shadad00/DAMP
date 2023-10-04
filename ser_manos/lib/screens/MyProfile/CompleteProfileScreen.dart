import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/molecules/components/profile_image.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/Notifier/UserProvider.dart';

class CompleteProfileScreen extends ConsumerWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ApplicationUser? user = ref.watch(currentUserProvider);


    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              ProfileImage(imageUrl: user!.profileImageUrl),
              const SizedBox(height: 16),
              const Text("Voluntario",
                  style: SermanosTypography.overline(
                      color: SermanosColors.neutral75)),
              Text('${user.name} ${user.surname}',
                  style: const SermanosTypography.subtitle01(
                      color: SermanosColors.neutral100)),
              const Text(
                  "¡Completá tu perfil para tener acceso a mejores oportunidades!",
                  textAlign: TextAlign.center,
                  style: SermanosTypography.body01(
                      color: SermanosColors.neutral75))
            ],
          ),
          Column(
            children: [
              ShortButton(
                  text: "Completar",
                  icon: SermanosIcons.add(status: SermanosIconStatus.back),
                  onPressed: () => context.beamToNamed("/profile/edit") )
            ],
          )
        ]);
  }
}
