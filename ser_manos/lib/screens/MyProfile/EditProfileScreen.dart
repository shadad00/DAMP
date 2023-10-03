import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/forms/ProfileDataForm.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/model/User.dart';

import '../../design_system/cells/forms/ContactDataForm.dart';

class EditProfileScreen extends StatelessWidget {
  final ApplicationUser user; 
  const EditProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SermanosHeader.modalHeader(),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileDataForm(
                      user: user,
                      genderField: "genderField",
                      birthdateField: "birthdateField",
                      imageField: "imageField"),
                  const SizedBox(height: 32),
                  const ContactDataForm(),
                  const SizedBox(height: 32),
                  CtaButton(
                      text: "Guardar Datos", onPressed: () {}, filled: true)
                ],
              ),
            )));
  }
}
