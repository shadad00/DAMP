import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/services/AuthService.dart';

import '../../model/User.dart';

class UserLoginData {
  final String email;
  final String password;

  const UserLoginData({required this.email, required this.password});

  String get getEmail => email;
  String get getPassword => password;
}

class UserRegisterData extends UserLoginData {
  final String name;
  final String surname;

  const UserRegisterData(
      {required super.email,
      required super.password,
      required this.name,
      required this.surname});

  String get getName => name;
  String get getSurname => surname;
}

final authRepositoryProvider = Provider<AuthService>((ref) => AuthService());

final userState = StateProvider<User?>((ref) => null);


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


