import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/logger/logger.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/navigation/navigation.dart';
import 'package:ser_manos/providers/Future/authentication/AuthProviders.dart';
import 'package:ser_manos/services/implementations/FirebaseStorageService.dart';
import '../../services/implementations/FirebaseAuthService.dart';
import '../../services/implementations/FirebaseNewsService.dart';
import '../../services/implementations/FirebaseUserService.dart';
import '../../services/implementations/FirebaseVolunteeringService.dart';
import '../../services/interfaces/AuthService.dart';
import '../../services/interfaces/StorageService.dart';
import '../../services/interfaces/NewsService.dart';
import '../../services/interfaces/UserService.dart';
import '../../services/interfaces/VolunteeringService.dart';
import '../Notifier/Authentication/UserProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'generated/Providers.g.dart';

@Riverpod(keepAlive: true)
UserService userService(UserServiceRef ref) {
  return FirebaseUserService(ref);
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return FirebaseAuthService(
      user: ref.read(currentUserProvider.notifier),
      userService: ref.read(userServiceProvider));
}

@Riverpod(keepAlive: true)
NewsService newsService(NewsServiceRef ref) {
  return FirebaseNewsService(firestore: ref.read(storageProvider));
}

@Riverpod(keepAlive: true)
VolunteeringService volunteeringService(VolunteeringServiceRef ref) {
  return const FirebaseVolunteeringService();
}

@Riverpod(keepAlive: true)
StorageService storageService(StorageServiceRef ref) {
  return FirebaseStorageService();
}

@Riverpod(keepAlive: true)
String? imageUrl(ImageUrlRef ref) {
  final ApplicationUser? user = ref.watch(currentUserProvider);
  if (user == null) {
    return "Invalid state";
  }
  return user.profileImageUrl;
}

@Riverpod(keepAlive: true)
FirebaseAnalytics analytics(AnalyticsRef ref) {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  analytics.setAnalyticsCollectionEnabled(true);
  return analytics;
}

@Riverpod(keepAlive: true)
FirebaseFirestore storage(StorageRef ref) {
  return FirebaseFirestore.instance;
}

Future<void> initializeProviders(ProviderContainer container) async {
  /// Firebase Analytics Setup
  container.read(analyticsProvider);

  /// Firebase Auth Setup
  container.read(firebaseAuthProvider);

  /// Firebase Database Setup
  container.read(storageProvider);

  /// Try Session Restore
  await container.read(sessionRestoreControllerProvider.future);
}

@Riverpod(keepAlive: true)
Future<void> sessionRestoreController(
  SessionRestoreControllerRef ref,
) async {
  final firebaseAuthClient = ref.read(firebaseAuthProvider);
  final User? firebaseAuthUser = firebaseAuthClient.currentUser;

  if (firebaseAuthUser != null) {
    /// Restore firebase user session
    try {
      /// Returns the current token if it has not expired. Otherwise, this will
      /// restore the token and return a new one.
      await firebaseAuthUser.getIdToken(true);

      final user = await ref
          .read(userServiceProvider)
          .getUserById(userId: firebaseAuthUser.uid);

      await ref.read(analyticsProvider).logEvent(name: "restored_session");

      ref.read(currentUserProvider.notifier).set(user);
      ref.read(delegateProvider).popToNamed("/volunteering");
    } catch (e) {
      logger.d("Error restoring Firebase session");
      ref.read(currentUserProvider.notifier).set(null);
      ref.read(delegateProvider).popToNamed("/login");
    }
  }
}
