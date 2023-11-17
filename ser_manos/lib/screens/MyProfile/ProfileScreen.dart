import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/tokens/SerManosLoading.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/screens/MyProfile/CompleteProfileScreen.dart';
import 'package:ser_manos/screens/MyProfile/ProfileInformationScreen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ApplicationUser? user = ref.watch(currentUserProvider);
    if (user == null) return const SerManosLoading(); 

    return user.isProfileFilled()
        ? const ProfileInformationScreen()
        : const CompleteProfileScreen();
  }

}
