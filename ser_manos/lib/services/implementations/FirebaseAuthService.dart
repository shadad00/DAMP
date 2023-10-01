import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/logger/logger.dart';
import 'package:ser_manos/providers/authentication/UserProvider.dart';

import '../interfaces /AuthService.dart';

class FirebaseAuthService implements AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CurrentUser user;

  const FirebaseAuthService({required this.user});

  @override
  Future<void> signIn({required UserLoginData userLoginData}) async {
    final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: userLoginData.getEmail, password: userLoginData.getPassword);
    logger.d("Received response from api $response" ); 
    user.set(true); 
  }

  @override
  Future<void> signUp({required UserRegisterData userRegisterData}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: userRegisterData.getEmail,
        password: userRegisterData.getPassword);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
