import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/model/VolunteeringPostulation.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/providers/Providers/Providers.dart';

part 'generated/Postulation.g.dart';

@Riverpod()
class Postulation extends _$Postulation {
  @override
  VolunteeringPostulation? build() {
    final ApplicationUser user = ref.read(currentUserProvider)!;
    return user.postulation;
  }

  void addPostulation(int volunteeringId) async {
    if (state != null) return;

    final ApplicationUser user = ref.read(currentUserProvider)!;
    VolunteeringPostulation newPostulation = VolunteeringPostulation(
        volunteeringId: volunteeringId, status: PostulationStatus.pending);
    await ref
        .read(userServiceProvider)
        .addPostulation(userId: user.id, postulation: newPostulation);
    await ref
        .read(volunteeringServiceProvider)
        .incrementVolunteerQuantity(volunteeringId);

    ref.invalidate(getVolunteeringsProvider); 
    ref.invalidate(getVolunteeringByIdProvider);

    user.postulation = newPostulation;
    state = user.postulation;
  }

  void removePostulation(int volunteeringId) async {
    if (state == null) return;

    final ApplicationUser user = ref.read(currentUserProvider)!;
     await ref
        .read(userServiceProvider)
        .removePostulation(userId: user.id, postulation: state!);
     await ref
        .read(volunteeringServiceProvider)
        .decrementVolunteerQuantity(volunteeringId);

    ref.invalidate(getVolunteeringsProvider); 
    ref.invalidate(getVolunteeringByIdProvider);

    user.postulation = null;
    state = user.postulation;
  }
}
