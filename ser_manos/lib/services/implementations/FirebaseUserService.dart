import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/logger/logger.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/model/VolunteeringPostulation.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/providers/Providers/Providers.dart';
import 'package:ser_manos/services/interfaces/UserService.dart';
import 'package:ser_manos/services/interfaces/VolunteeringService.dart';

import '../../model/Gender.dart';
import '../../model/Volunteering.dart';

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

      VolunteeringPostulation? postulation;
      final volunteerings = await firestore
          .collection("/users")
          .doc(userId)
          .collection("/postulation")
          .get();

      final currentVolunteering = volunteerings.docs.firstOrNull;

      if (currentVolunteering != null) {
        postulation = VolunteeringPostulation.fromJson(
          volunteeringId: currentVolunteering.id,
          json: currentVolunteering.data(),
        );
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
          profileImageUrl: json['profileImageUrl'],
          phone: json['phone'],
          emailContact: json['emailContact'],
          favorites: List.from(
            json['favorites'],
          ),
          postulation: postulation);
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
        'favorites': const []
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
          favorites: json['favorites']
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
      required String emailContact,
      required String? profileImageUrl}) async {
    try {
      final query = firestore.collection("/users").doc(userId);

      final userDataMap = {
        'birthdate': birthdate,
        'emailContact': emailContact,
        'gender': gender.name,
        'phone': phone,
        'profileImageUrl': profileImageUrl,
      };
      if (profileImageUrl == null) {
        final imageEntry = {
          'profileImageUrl': ref.watch(currentUserProvider)?.profileImageUrl,};
        userDataMap.addEntries(imageEntry.entries);
      }

      await query.update(userDataMap);
      ref.read(currentUserProvider.notifier).update(userDataMap);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> updateFavoriteList(
      {required String userId, required List<int>? volunteerings}) async {
    if (volunteerings == null) return;

    try {
      final query = firestore.collection("/users").doc(userId);

      final userDataMap = {
        'favorites': volunteerings,
      };

      await query.update(userDataMap);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> addPostulation(
      {required String userId,
      required VolunteeringPostulation postulation}) async {
    try {
      Volunteering? relatedVolunteering = await ref
          .read(volunteeringServiceProvider)
          .getVolunteeringById(id: postulation.volunteeringId.toString());

      if (relatedVolunteering == null ||
          relatedVolunteering.volunteerQuantity >=
              relatedVolunteering.capacity) {
        return;
      }

      final userPostulationQuery = firestore
          .collection("/users")
          .doc(userId)
          .collection("/postulation")
          .doc(relatedVolunteering.id.toString());

      await userPostulationQuery.set({
        'volunteering_id': relatedVolunteering.id,
        'status': PostulationStatus.pending.name
      });
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<void> removePostulation(
      {required String userId,
      required VolunteeringPostulation postulation}) async {
    final userPostulationQuery = firestore
        .collection("/users")
        .doc(userId)
        .collection("/postulation")
        .doc(postulation.volunteeringId.toString());

    await userPostulationQuery.delete();
  }
}
