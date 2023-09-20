import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/cells/cards/InformationCards/InformationCard.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/molecules/components/profile_image.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/model/Gender.dart';
import 'package:ser_manos/model/User.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({super.key});

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
        body: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              ProfileImage(imageUrl: mockedUser.profileImageUrl),
              const Text("Voluntario",
                  style: SermanosTypography.overline(
                      color: SermanosColors.neutral75)),
              Text('${mockedUser.name} ${mockedUser.surname}',
                  style: const SermanosTypography.subtitle01(
                      color: SermanosColors.neutral75)),
              Text(mockedUser.email,
                  style: const SermanosTypography.body01(
                      color: SermanosColors.secondary200)),
              const SizedBox(height: 16),
              InformationCard(
                  title: "Información personal",
                  firsTitle: "FECHA DE NACIMIENTO",
                  firstSubtitle: mockedUser.birthdate.toString(),
                  secondTitle: "GÈNERO",
                  secondSubtitle: mockedUser.gender!.text),
              const SizedBox(height: 16),
              InformationCard(
                  title: "Datos de contacto",
                  firsTitle: "TELÈFONO",
                  firstSubtitle: mockedUser.phone!,
                  secondTitle: "E-MAIL",
                  secondSubtitle: mockedUser.email),
              const SizedBox(height: 16),
              CtaButton(text: "EditarPerfil", onPressed: () {}, filled: true),
              const SizedBox(height: 8),
              CtaButton(text: "Cerrar Sesión", onPressed: () {}, filled: false)
            ],
          ),
        ));
  }
}
