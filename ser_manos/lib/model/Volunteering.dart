import 'package:equatable/equatable.dart';

class Volunteering extends Equatable {
  final String id;
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
  });

  //This is used to compare with equatable. 
  @override
  List<Object?> get props => [id];


  bool isFull() {
    return capacity == volunteerQuantity;
  }
}
