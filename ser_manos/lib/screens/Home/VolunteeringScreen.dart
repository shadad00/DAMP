import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/screens/Home/VolunteeringListScreen.dart';



final searchQueryProvider = StateProvider<String>((ref) => '');

class VolunteeringScreen extends ConsumerWidget {
  const VolunteeringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const VolunteeringListScreen();
  }
}
