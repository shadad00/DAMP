import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/providers/authentication/AuthProviders.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signIn({required UserLoginData userLoginData}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: userLoginData.getEmail, password: userLoginData.getPassword);
  }

  Future<void> signUp({required UserRegisterData userRegisterData}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: userRegisterData.getEmail, password: userRegisterData.getPassword);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }


}
