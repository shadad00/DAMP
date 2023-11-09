import 'package:firebase_core/firebase_core.dart';
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

  await providers.initializeProviders(container);

  return container;
}

