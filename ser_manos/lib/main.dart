import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/navigation/navigation.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:ser_manos/bootstrap.dart';


void main() async {
  ProviderContainer container = await bootstrap();

  await FlutterConfig.loadEnvVariables();
    runApp(
    UncontrolledProviderScope(
      container: container,
      child: const SerManos(),
    ),
  );

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
