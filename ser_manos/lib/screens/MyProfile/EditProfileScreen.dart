import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/forms/ProfileDataForm.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/model/Gender.dart';
import 'package:ser_manos/model/User.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../design_system/cells/forms/ContactDataForm.dart';

class EditProfileModal extends StatelessWidget {
  const EditProfileModal({super.key});

  static const ApplicationUser user = ApplicationUser(
    id: '1234567890',
    name: 'John',
    surname: 'Doe',
    email: 'johndoe@gmail.com',
    phone: '1234567890',
    gender: Gender.male,
    profileImageUrl: null,
    emailContact: 'johndoe@gmail.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SermanosHeader.modalHeader(),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProfileDataForm(
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
