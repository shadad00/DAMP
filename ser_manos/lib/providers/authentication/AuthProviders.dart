import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/services/implementations/FirebaseAuthService.dart';
import '../../services/interfaces /AuthService.dart';


final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authRepositoryProvider =
    Provider<AuthService>((ref) => FirebaseAuthService());

// @riverpod
final loginProvider =
    FutureProvider.family<void, UserLoginData>((ref, userData) async {
  final authRepository = ref.read(authRepositoryProvider);
  await authRepository.signIn(userLoginData: userData);
  // ref.read(userState.notifier).state =
});

final registerProvider =
    FutureProvider.family<void, UserRegisterData>((ref, userData) async {
  final authRepository = ref.read(authRepositoryProvider);
  return await authRepository.signUp(userRegisterData: userData);
});




