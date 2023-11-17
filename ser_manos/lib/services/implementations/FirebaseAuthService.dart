import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/services/interfaces/UserService.dart';

import '../../providers/Notifier/Authentication/UserProvider.dart';
import '../interfaces/AuthService.dart';

class FirebaseAuthService implements AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CurrentUser user;
  final UserService userService;

  const FirebaseAuthService({required this.user, required this.userService});

  @override
  Future<ApplicationUser?> signIn(
      {required UserLoginData userLoginData}) async {
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
  Future<ApplicationUser?> signUp(
      {required UserRegisterData userRegisterData}) async {
    final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
      email: userRegisterData.email,
      password: userRegisterData.password,
    );

    await userService.createUser(
      name: userRegisterData.getName,
      surname: userRegisterData.getSurname,
      email: userCredentials.user!.email!,
      userId: userCredentials.user!.uid,
    );

    return signIn(
        userLoginData: UserLoginData(
            email: userRegisterData.email,
            password: userRegisterData.password));
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    user.set(null);
  }
}
