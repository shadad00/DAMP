import 'package:beamer/beamer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:ser_manos/providers/Providers/Providers.dart';

import '../../../model/Gender.dart';
import '../../../model/User.dart';
import '../../../navigation/navigation.dart';

part 'generated/UpdateUserFuture.g.dart';

@riverpod
class UpdateUserFuture extends _$UpdateUserFuture {
  @override
  FutureOr<void> build() async {}

  Future<void> updateUser(
      {required String userId,
      required ApplicationUser user,
      required String phone,
      required Gender gender,
      required DateTime birthdate,
      required String emailContact}) async {
    state = const AsyncValue.loading();

    try {
      final userService = ref.read(userServiceProvider);
      userService.updateUser(
          userId: userId,
          user: user,
          phone: phone,
          gender: gender,
          birthdate: birthdate,
          emailContact: emailContact);
      final BeamerDelegate delegate = ref.read(delegateProvider);
      delegate.beamBack(); 
    } on firebase.FirebaseAuthException catch (e) {
      state = AsyncError(e.message!, StackTrace.current);
    }
  }
}
