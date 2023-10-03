import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/model/User.dart';

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
}
