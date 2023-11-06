import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/services/interfaces/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../../navigation/navigation.dart';
import '../../Providers/Providers.dart';

part 'generated/SignUpFutureProvider.g.dart';

@riverpod
class SignUpFuture extends _$SignUpFuture {
  @override
  FutureOr<void> build() async {}

  Future<void> singUp({
    required UserRegisterData userRegisterData,
  }) async {
    state = const AsyncValue.loading();

    try {
      final authRepository = ref.read(authServiceProvider);
      await authRepository.signUp(userRegisterData: userRegisterData);
      await ref.read(analyticsProvider).logSignUp(
            signUpMethod: 'email_and_password',
          );
      final BeamerDelegate delegate = ref.read(delegateProvider);
      delegate.beamToNamed("/welcome");
    } on firebase.FirebaseAuthException catch (e) {
      final errorMessage = _mapFirebaseErrorToMessage(e);
      state = AsyncError(errorMessage, StackTrace.current);
    }
  }

  String _mapFirebaseErrorToMessage(Exception e) {
    final errorCode = (e as firebase.FirebaseAuthException).code;
    final errorMessages = {
      "INVALID_LOGIN_CREDENTIALS": "Email o contraseña incorrectos",
      "invalid-email": "Email inválido",
      "email-already-in-use": "Email ya en uso",
      "weak-password": "Contraseña débil",
      "timeout": "Tiempo de espera agotado",
      // Add more error codes and messages as needed
    };

    return errorMessages[errorCode] ?? "Ocurrió un error inesperado";
  }
}
