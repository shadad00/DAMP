import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/model/User.dart';

import '../model/Gender.dart';

class UserRemoteDataSourceImpl {
  const UserRemoteDataSourceImpl();

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<ApplicationUser?> getUserById({
    required String userId,
  }) async {
    try {
      final query = firestore.collection("/users").doc(userId);

      final response = await query.get();
      if (!response.exists || response.data() == null) {
        return null;
      }

      Map<String, dynamic> json = response.data()!;

      return ApplicationUser(
        id: userId,
        name: json['name'],
        surname: json['surname'],
        email: json['email'],
        gender: Gender.getGenderFromString(json['gender']),
        birthdate: (json['birthdate'] as Timestamp).toDate(),
        profileImageUrl: json['profileImage'],
        phone: json['phone'],
        emailContact: json['emailContact'],
      );
    } catch (e) {
      return null;
    }
  }

  Future<ApplicationUser?> createUser({
    required String userId,
    required String name,
    required String surname,
    required String email,
  }) async {
    try {
      final query = firestore.collection("/users").doc(userId);

      final userDataMap = {
        'name': name,
        'surname': surname,
        'email': email,
      };

      await query.set(userDataMap);

      Map<String, dynamic> json = userDataMap; 

      return ApplicationUser(
        id: userId,
        name: json['name'],
        surname: json['surname'],
        email: json['email'],
        gender: Gender.getGenderFromString(json['gender']),
        birthdate: (json['birthdate'] as Timestamp).toDate(),
        profileImageUrl: json['profileImage'],
        phone: json['phone'],
        emailContact: json['emailContact'],
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> updateUser(
      {required String userId,
      required ApplicationUser user,
      required String phone,
      required Gender gender,
      required DateTime birthdate,
      required String emailContact}) async {
    try {
      final query = firestore.collection("/users").doc(userId);

      final userDataMap = {
        'birthdate': birthdate,
        'emailContact': emailContact,
        'gender': gender.name,
        'phone': phone,
      };

      await query.update(userDataMap);
    } catch (e) {
      throw Exception();
    }
  }
}
