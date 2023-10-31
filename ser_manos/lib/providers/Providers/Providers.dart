import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
  return const FirebaseNewsService();
}

@Riverpod(keepAlive: true)
VolunteeringService volunteeringService(VolunteeringServiceRef ref) {
  return const FirebaseVolunteeringService();
}

@Riverpod(keepAlive: true)
StorageService storageService(StorageServiceRef ref) {
  return FirebaseStorageService(); 
}
