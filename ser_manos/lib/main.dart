import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/model/Gender.dart';
import 'package:ser_manos/navigation/navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: SerManos()));
}

class SerManos extends ConsumerWidget {
  const SerManos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BeamerDelegate delegate = ref.watch(delegateProvider);
    return BeamerProvider(
      routerDelegate: delegate,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'ser manos',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routeInformationParser: BeamerParser(),
        routerDelegate: delegate,
        backButtonDispatcher: BeamerBackButtonDispatcher(
          delegate: delegate,
        ),
      ),
    );
  }
}
