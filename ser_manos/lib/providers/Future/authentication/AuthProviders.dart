import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/model/User.dart';
import '../../../services/interfaces/AuthService.dart';
import '../../Providers/Providers.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);


// @riverpod
final loginProvider =
    FutureProvider.family<ApplicationUser?, UserLoginData>((ref, userData) async {
  final authRepository = ref.read(authServiceProvider);
  await authRepository.signIn(userLoginData: userData);
  // ref.read(delegateProvider).beamToNamed("/volunteering"); 
});

final registerProvider =
    FutureProvider.family<ApplicationUser?, UserRegisterData>((ref, userData) async {
  final authRepository = ref.read(authServiceProvider);
  return await authRepository.signUp(userRegisterData: userData);
});
