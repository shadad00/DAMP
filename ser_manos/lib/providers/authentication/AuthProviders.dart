import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/authentication/UserProvider.dart';
import 'package:ser_manos/services/implementations/FirebaseAuthService.dart';
import 'package:ser_manos/services/implementations/FirebaseUserService.dart';
import 'package:ser_manos/services/interfaces%20/UserService.dart';
import '../../services/interfaces /AuthService.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);


final userServiceProvider = Provider<UserService>((ref) => const FirebaseUserService()); 

final authRepositoryProvider = Provider<AuthService>((ref) {
  return FirebaseAuthService(user: ref.read(currentUserProvider.notifier), userService: ref.read(userServiceProvider));
});

// @riverpod
final loginProvider =
    FutureProvider.family<ApplicationUser?, UserLoginData>((ref, userData) async {
  final authRepository = ref.read(authRepositoryProvider);
  await authRepository.signIn(userLoginData: userData);
  // ref.read(delegateProvider).beamToNamed("/volunteering"); 
});

final registerProvider =
    FutureProvider.family<ApplicationUser?, UserRegisterData>((ref, userData) async {
  final authRepository = ref.read(authRepositoryProvider);
  return await authRepository.signUp(userRegisterData: userData);
});
