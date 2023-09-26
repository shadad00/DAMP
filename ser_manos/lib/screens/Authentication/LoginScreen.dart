import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/cells/forms/LoginForm.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/atoms/icons/logo.dart';
import 'package:ser_manos/providers/authentication/AuthProviders.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  LoginForm(),
                ],
              ),
              const SizedBox(height: 160),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Consumer(
                      builder: (context, ref, child) => CtaButton(
                          text: "Iniciar sesión",
                          onPressed: () {
                            if (!loginFormKey.currentState!.validate()) {
                              print("Invalid");
                              return;
                            }
                            final response =
                                ref.watch(loginProvider(UserLoginData(
                              email: loginFormKey
                                  .currentState!.fields['email']!.value,
                              password: loginFormKey
                                  .currentState!.fields['password']!.value,
                            )));
                            response.when(
                              data: (data) => context.beamToNamed("/welcome"),
                              loading: () => const Text("Loading"),
                              error: (error, stackTrace) => const Text("Error"),
                            );
                          },
                          filled: true)),
                  const SizedBox(height: 16),
                  CtaButton(
                    text: 'No tengo cuenta',
                    onPressed: () => context.beamToNamed("/register"),
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
