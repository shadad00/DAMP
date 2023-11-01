import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/model/User.dart';

import '../../../model/Gender.dart';

part 'generated/UserProvider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  ApplicationUser? build() {
    return null;
  }

  void set(ApplicationUser? user) {
    state = user;
  }

  bool isLoggedIn() {
    return state != null;
  }

  void update(Map map) {
    if (state != null) {
      state = state!.update(
          phone: map['phone'],
          gender: Gender.getGenderFromString(map['gender'])!,
          birthdate: map['birthdate'],
          emailContact: map['emailContact'],
          profileImageUrl: map['profileImageUrl']);
    }
  }

  void updateImageUrl(String? imageUrl) {
    if (state != null) {
      state = state!.update(
          phone: state!.phone!,
          gender: state!.gender!,
          birthdate: state!.birthdate!,
          emailContact: state!.emailContact!,
          profileImageUrl: imageUrl);
    }
  }

}
