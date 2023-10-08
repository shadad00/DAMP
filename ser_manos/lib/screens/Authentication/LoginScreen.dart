import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/cells/forms/LoginForm.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/atoms/icons/logo.dart';
import 'package:ser_manos/providers/AsyncNotifiers/Authentication/LoginFutureProvider.dart';
import '../../services/interfaces/AuthService.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool loading = false;
    String? errorText;

    ref.watch(loginFutureProvider).maybeWhen(
          loading: () => loading = true,
          error: (error, stackTrace) => errorText = error.toString(),
          orElse: () {},
        );


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SermanosLogos.square(
                      logoUrl: "assets/images/SquareLogo.png"),
                  const SizedBox(height: 32),
                  LoginForm(
                    isLoading: loading,
                    errorText: errorText,
                  ),
                ],
              ),
              const SizedBox(height: 160),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CtaButton(
                      text: "Iniciar sesión",
                      onPressed: () async {
                        if (!loginFormKey.currentState!.validate()) {
                          return;
                        }
                        final UserLoginData userLoginData = UserLoginData(
                          email:
                              loginFormKey.currentState!.fields['email']!.value,
                          password: loginFormKey
                              .currentState!.fields['password']!.value,
                        );

                        await ref
                            .read(loginFutureProvider.notifier)
                            .signIn(userLoginData: userLoginData);
                      },
                      filled: true),
                  const SizedBox(height: 16),
                  CtaButton(
                    loading: loading,
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
