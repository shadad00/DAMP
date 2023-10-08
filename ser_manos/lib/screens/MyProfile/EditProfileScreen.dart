import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/design_system/cells/forms/ProfileDataForm.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/Notifier/UserProvider.dart';
import 'package:ser_manos/providers/Providers/Providers.dart';
import 'package:ser_manos/services/interfaces/UserService.dart';

import '../../design_system/cells/forms/ContactDataForm.dart';

final profileForm = GlobalKey<FormBuilderState>();

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
                child: FormBuilder(
              key: profileForm,
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
                        if (!profileForm.currentState!.validate()) {
                          return;
                        }

                        await userService.updateUser(
                            userId: user.id,
                            user: user,
                            phone: profileForm
                                .currentState!.fields['phone']!.value,
                            gender: profileForm
                                .currentState!.fields['gender']?.value,
                            birthdate: DateFormat('dd/MM/yyyy').parse(
                                profileForm
                                    .currentState!.fields['birthdate']!.value),
                            emailContact: profileForm
                                .currentState!.fields['email']?.value);
                      },
                      filled: true)
                ],
              ),
            ))));
  }
}
