import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Volunteering extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String about;
  final String address;
  final List<String> requirements;
  final List<String> availability;
  final String imageUrl;
  final int capacity;
  final int volunteerQuantity;
  final DateTime creationTime;
  final double lat;
  final double long;

  const Volunteering({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.about,
    required this.address,
    required this.requirements,
    required this.availability,
    required this.imageUrl,
    required this.capacity,
    required this.volunteerQuantity,
    required this.creationTime,
    required this.lat,
    required this.long,
  });

  //This is used to compare with equatable.
  @override
  List<Object?> get props => [id];

  bool isFull() {
    return capacity <= volunteerQuantity;
  }

  factory Volunteering.fromJson({
    required String volunteeringId,
    required Map<String, dynamic> eachVolunteering,
  }) {
    return Volunteering(
        id: int.parse(volunteeringId),
        about: eachVolunteering['about'],
        address: eachVolunteering['address'],
        availability: List<String>.from(
            eachVolunteering['availability'] as List<dynamic>),
        capacity: eachVolunteering['capacity'],
        category: eachVolunteering['category'],
        description: eachVolunteering['description'],
        imageUrl: eachVolunteering['imageUrl'],
        name: eachVolunteering['name'],
        requirements: List<String>.from(
            eachVolunteering['requirements'] as List<dynamic>),
        volunteerQuantity: eachVolunteering['volunteerQuantity'],
        creationTime: DateTime.now(),
        lat: eachVolunteering['lat'],
        long: eachVolunteering['long']);
  }

  Map<String, dynamic> toMap() {
    return {
      "address": address,
      "about": about,
      "name": name,
      "category": category,
      "description": description,
      "requirements": requirements,
      "availability": availability,
      "lat": lat,
      "long": long,
      "imageUrl": imageUrl,
      "capacity": capacity,
      "volunteerQuantity": volunteerQuantity,
    };
  }
  
}
