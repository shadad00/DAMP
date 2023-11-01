import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/design_system/cells/forms/ProfileDataForm.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/AsyncNotifiers/Profile/UpdateUserFuture.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/providers/Notifier/Profile/PathProvider.dart';

import '../../design_system/cells/forms/ContactDataForm.dart';
import '../../providers/Providers/Providers.dart';
import '../../services/interfaces/StorageService.dart';

final profileForm = GlobalKey<FormBuilderState>();

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ApplicationUser? user = ref.watch(currentUserProvider);
    bool loading = false;

    ref
        .watch(updateUserFutureProvider)
        .maybeWhen(loading: () => loading = true, orElse: () {});

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
                      imageField: "path"),
                  const SizedBox(height: 32),
                  ContactDataForm(
                    user: user,
                  ),
                  const SizedBox(height: 32),
                  CtaButton(
                      loading: loading,
                      text: "Guardar Datos",
                      onPressed: () async {
                        if (!profileForm.currentState!.validate()) {
                          return;
                        }

                        String? imageUrl;

                        if (ref.read(pathProvider.notifier).wasProvided()) {
                          final StorageService storageService =
                              ref.read(storageServiceProvider);
                          imageUrl = await storageService.uploadFile(
                              path: ref.read(pathProvider)!, userId: user.id);
                        }

                        ref.read(updateUserFutureProvider.notifier).updateUser(
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
                                .currentState!.fields['email']?.value,
                            profileImageUrl: imageUrl);
                      },
                      filled: true)
                ],
              ),
            ))));
  }
}
