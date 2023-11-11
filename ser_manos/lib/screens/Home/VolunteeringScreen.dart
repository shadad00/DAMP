import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/providers/Notifier/Volunteering/HomeScreenMode.dart';
import 'package:ser_manos/screens/Home/VolunteeringListScreen.dart';
import 'package:ser_manos/screens/Home/VolunteeringMapScreen.dart';



final searchQueryProvider = StateProvider<String>((ref) => '');

class VolunteeringScreen extends ConsumerWidget {
  const VolunteeringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeScreenMode = ref.watch(homeScreenModeProvider);
    // return VolunteeringMapScreen();
    return homeScreenMode == viewModes.carrusel
        ? const VolunteeringMapScreen()
        : const VolunteeringListScreen();
  }
}
