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
      final BeamerDelegate delegate = ref.read(delegateProvider);
      delegate.beamToNamed("/welcome");
    } on firebase.FirebaseAuthException catch (e) {
      state = AsyncError(e.message!, StackTrace.current);
    }
  }
}
