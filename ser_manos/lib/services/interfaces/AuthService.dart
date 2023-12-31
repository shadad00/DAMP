import 'package:ser_manos/model/User.dart';

abstract interface class AuthService {
  Future<ApplicationUser?> signIn({required UserLoginData userLoginData});
  Future<ApplicationUser?> signUp({required UserRegisterData userRegisterData});
  Future<void> signOut(); 
}


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