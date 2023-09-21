import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/molecules/components/profile_image.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/model/Gender.dart';
import 'package:ser_manos/model/User.dart';

class CompleteProfileScreen extends HookWidget {
  const CompleteProfileScreen({super.key});

  static User mockedUser = User(
    id: "0",
    name: "Juan Cruz",
    surname: "Gonzalez",
    email: "mimail@gmail.com",
    phone: "3875198135",
    birthdate: DateTime(2000, 03, 03),
    gender: Gender.male,
    profileImageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153',
  );

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 3);

    return Scaffold(
      appBar: SermanosHeader.tabsHeader(controller: controller),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Column(
          children: [
            ProfileImage(imageUrl: mockedUser.profileImageUrl),
            const SizedBox(height: 16),
            const Text("Voluntario",
                style: SermanosTypography.overline(
                    color: SermanosColors.neutral75)),
            Text('${mockedUser.name} ${mockedUser.surname}',
                style: const SermanosTypography.subtitle01(
                    color: SermanosColors.neutral100)),
            const Text(
                "¡Completá tu perfil para tener acceso a mejores oportunidades!",
                textAlign: TextAlign.center,
                style:
                    SermanosTypography.body01(color: SermanosColors.neutral75))
          ],
        ),
        Column(
          children: [
            ShortButton(
                text: "Completar",
                icon: SermanosIcons.add(status: SermanosIconStatus.back),
                onPressed: () {})
          ],
        )
      ]),
    );
  }
}
