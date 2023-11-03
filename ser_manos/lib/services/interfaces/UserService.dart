import 'package:ser_manos/model/VolunteeringPostulation.dart';

import '../../model/Gender.dart';
import '../../model/User.dart';

abstract interface class UserService {
  Future<ApplicationUser?> getUserById({required String userId});

  Future<ApplicationUser?> createUser({
    required String userId,
    required String name,
    required String surname,
    required String email,
  });

  Future<void> updateUser(
      {required String userId,
      required ApplicationUser user,
      required String phone,
      required Gender gender,
      required DateTime birthdate,
      required String emailContact,
      required String? profileImageUrl});

  Future<void> updateFavoriteList(
      {required String userId, required List<int>? volunteerings});

  Future<void> addPostulation(
      {required String userId, required VolunteeringPostulation postulation});

  Future<void> removePostulation(
      {required String userId, required VolunteeringPostulation postulation});
}
