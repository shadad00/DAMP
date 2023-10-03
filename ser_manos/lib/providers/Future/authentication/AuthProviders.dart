import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/model/User.dart';
import '../../../services/interfaces/AuthService.dart';
import '../../Providers/Providers.dart';

part 'generated/AuthProviders.g.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

@riverpod
Future<ApplicationUser?> login(LoginRef ref,
    {required UserLoginData userLoginData}) async {
  final authRepository = ref.read(authServiceProvider);
  return await authRepository.signIn(userLoginData: userLoginData);
}

@riverpod
Future<ApplicationUser?> register(RegisterRef ref,
    {required UserRegisterData userRegisterData}) async {
  final authRepository = ref.read(authServiceProvider);
  return await authRepository.signUp(userRegisterData: userRegisterData);
}
