import 'package:firebase_auth/firebase_auth.dart';
import '../interfaces /AuthService.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signIn({required UserLoginData userLoginData}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: userLoginData.getEmail, password: userLoginData.getPassword);
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
