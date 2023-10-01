import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/atoms/icons/logo.dart';
import 'package:ser_manos/design_system/cells/forms/RegisterForm.dart';

import '../../providers/authentication/AuthProviders.dart';
import '../../services/interfaces /AuthService.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SermanosLogos.square(logoUrl: "assets/images/SquareLogo.png"),
                  SizedBox(height: 32),
                  RegisterForm(),
                ],
              ),
              const SizedBox(height: 90),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Consumer(
                    builder: (context, ref, child) => CtaButton(
                        text: "Registrarse",
                        onPressed: () {
                          if (!registerFormKey.currentState!.validate()) {
                            print("Invalid"); 
                            return;
                          }
                          final response = ref.watch(registerProvider(
                              UserRegisterData(
                                  email: registerFormKey
                                      .currentState!.fields['email']!.value,
                                  password: registerFormKey
                                      .currentState!.fields['password']!.value,
                                  name: registerFormKey
                                      .currentState!.fields['name']!.value,
                                  surname: registerFormKey.currentState!
                                      .fields['surname']!.value)));
                          response.when(
                            data: (data) => context.beamToNamed("/welcome"),
                            loading: () => const Text("Loading"),
                            error: (error, stackTrace) => const Text("Error"),
                          );
                        },
                        filled: true),
                  ),
                  const SizedBox(height: 16),
                  CtaButton(
                    text: 'Ya tengo cuenta',
                    onPressed: () => context.beamToNamed("/login"),
                    textColor: SermanosColors.primary100,
                    filled: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
