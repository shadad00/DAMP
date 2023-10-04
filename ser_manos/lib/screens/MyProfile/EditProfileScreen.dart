import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/cells/forms/ProfileDataForm.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/Notifier/UserProvider.dart';
import 'package:ser_manos/providers/Providers/Providers.dart';
import 'package:ser_manos/services/interfaces/UserService.dart';

import '../../design_system/cells/forms/ContactDataForm.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ApplicationUser? user = ref.watch(currentUserProvider);
    final UserService userService = ref.watch(userServiceProvider);

    return Scaffold(
        appBar: SermanosHeader.modalHeader(),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileDataForm(
                    user: user!,
                    genderField: "gender",
                    birthdateField: "birthdate",
                    // imageField: "image"
                  ),
                  const SizedBox(height: 32),
                  const ContactDataForm(),
                  const SizedBox(height: 32),
                  CtaButton(
                      text: "Guardar Datos",
                      onPressed: () async {
                        bool valid = profileDataFormKey.currentState!.validate() && contactDataFormKey.currentState!.validate();
                        if (!valid) {
                          return;
                        }

                        await userService.updateUser(
                            userId: user.id,
                            user: user,
                            phone: contactDataFormKey
                                .currentState!.fields['phone']!.value,
                            gender: profileDataFormKey
                                .currentState!.fields['gender']?.value,
                            birthdate: profileDataFormKey
                                .currentState!.fields['birthdate']?.value,
                            emailContact: contactDataFormKey
                                .currentState!.fields['email']?.value);
                      },
                      filled: true)
                ],
              ),
            )));
  }
}
