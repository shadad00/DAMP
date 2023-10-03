import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/authentication/UserProvider.dart';
import 'package:ser_manos/services/interfaces%20/UserService.dart';

import '../interfaces /AuthService.dart';

class FirebaseAuthService implements AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CurrentUser user;
  final UserService userService;

  const FirebaseAuthService({required this.user, required this.userService});

  @override
  Future<ApplicationUser?> signIn({required UserLoginData userLoginData}) async {
    final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
      email: userLoginData.email,
      password: userLoginData.password,
    );

    final retrievedUser =
        await userService.getUserById(userId: userCredentials.user!.uid);

    user.set(retrievedUser);
    return retrievedUser; 
  }

  @override
  Future<ApplicationUser?> signUp({required UserRegisterData userRegisterData}) async {
    final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
      email: userRegisterData.email,
      password: userRegisterData.password,
    );

    return await userService.createUser(
      name: userRegisterData.getName,
      surname: userRegisterData.getSurname,
      email: userCredentials.user!.email!,
      userId: userCredentials.user!.uid,
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
