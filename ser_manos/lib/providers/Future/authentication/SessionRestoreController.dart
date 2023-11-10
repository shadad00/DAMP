import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/logger/logger.dart';
import 'package:ser_manos/navigation/navigation.dart';
import 'package:ser_manos/providers/Future/authentication/AuthProviders.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/providers/Notifier/Profile/PathProvider.dart';
import 'package:ser_manos/providers/Providers/Providers.dart';
import 'package:ser_manos/services/implementations/FirebaseAuthService.dart';

part 'generated/SessionRestoreController.g.dart';

@Riverpod(keepAlive: true)
Future<void> SessionRestoreController(SessionRestoreControllerRef ref) async {
  final authRepository = ref.read(firebaseAuthProvider);
  final User? oldUser = authRepository.currentUser;


  if (oldUser != null) {
    // restore firebase user session
    try {
      await oldUser.getIdToken(true);

      final user =
          await ref.read(userServiceProvider).getUserById(userId: oldUser.uid);
      if (user != null) {
        ref.read(currentUserProvider.notifier).set(user);
      }
    } catch (e) {
      logger.d('Error al restaurar la sesion: $e');
    }
    return;
  }

}
