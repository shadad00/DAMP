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

  logger.i('sermanos_DEBUG?');

  if (oldUser != null) {
    // restore firebase user session
    try {
      logger.i('sermanos_DEBUG old user not null');
      await oldUser.getIdToken(true);

      final user =
          await ref.read(userServiceProvider).getUserById(userId: oldUser.uid);
      logger.i('sermanos_DEBUG new user: $user');
      if (user != null) {
        ref.read(currentUserProvider.notifier).set(user);
        final BeamerDelegate delegate = ref.read(delegateProvider);
        delegate.beamToNamed("/volunteering");
        var loggedin = ref.watch(currentUserProvider.notifier).isLoggedIn();
        logger.i('sermanos_DEBUG loggedin: $loggedin');
      }
    } catch (e) {
      logger.d('Error al restaurar la sesion: $e');
    }
    return;
  }

}
