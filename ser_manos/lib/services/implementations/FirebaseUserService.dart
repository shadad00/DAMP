import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/logger/logger.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/services/interfaces/UserService.dart';

import '../../model/Gender.dart';

class FirebaseUserService implements UserService {
  ProviderRef<UserService> ref;
  FirebaseUserService(this.ref);

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
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
        birthdate: json['birthdate'] != null
            ? (json['birthdate'] as Timestamp).toDate()
            : null,
        profileImageUrl: json['profileImage'],
        phone: json['phone'],
        emailContact: json['emailContact'],
      );
    } catch (e) {
      return null;
    }
  }

  @override
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
        birthdate: json['birthdate'] != null
            ? (json['birthdate'] as Timestamp).toDate()
            : null,
        profileImageUrl: json['profileImage'],
        phone: json['phone'],
        emailContact: json['emailContact'],
      );
    } catch (e) {
      logger.e("unable to create user");
      return null;
    }
  }

  @override
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
      ref.read(currentUserProvider.notifier).update(userDataMap); 
    } catch (e) {
      throw Exception();
    }
  }
}
