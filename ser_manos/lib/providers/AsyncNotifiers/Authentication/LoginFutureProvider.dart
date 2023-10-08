import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/services/interfaces/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../../navigation/navigation.dart';
import '../../Providers/Providers.dart';

part 'generated/LoginFutureProvider.g.dart';

@riverpod
class LoginFuture extends _$LoginFuture {
  @override
  FutureOr<void> build() async {}

  Future<void> signIn({
    required UserLoginData userLoginData,
  }) async {
    state = const AsyncValue.loading();

    try {
      final authRepository = ref.read(authServiceProvider);
      await authRepository.signIn(userLoginData: userLoginData);
      final BeamerDelegate delegate = ref.read(delegateProvider);
      delegate.beamToNamed("/volunteering");
    } on firebase.FirebaseAuthException catch (e) {
      state = AsyncError(e.message!, StackTrace.current);
    }
  }
}
