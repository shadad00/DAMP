import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './providers/Providers/Providers.dart' as providers;

/// Initializes app dependencies before it starts
Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 

  final container = ProviderContainer(
    overrides: [],
    observers: [],
  );


  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await providers.initializeProviders(container);
  return container;

}

