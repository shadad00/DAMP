import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/navigation/navigation.dart';
import '../../../services/interfaces/AuthService.dart';
import '../../Providers/Providers.dart';

part 'generated/AuthProviders.g.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// @riverpod
// Future<void> login(LoginRef ref, {required UserLoginData userLoginData}) async {
//   final authRepository = ref.read(authServiceProvider);
//   await authRepository.signIn(userLoginData: userLoginData);
//   final BeamerDelegate delegate = ref.read(delegateProvider);
//   delegate.beamToNamed("/volunteering");
// }

@riverpod
Future<void> register(RegisterRef ref,
    {required UserRegisterData userRegisterData}) async {
  final authRepository = ref.read(authServiceProvider);
  await authRepository.signUp(userRegisterData: userRegisterData);
  final BeamerDelegate delegate = ref.read(delegateProvider);
  delegate.beamToNamed("/welcome");
}
