import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/model/Volunteering.dart';
import '../interfaces /VolunteeringService.dart';

class FirebaseVolunteeringService implements VolunteeringService {
  const FirebaseVolunteeringService();

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static const String collectionName = "volunteering";

  @override
  Future<Volunteering?> getVolunteeringById({required String id}) async {
    final eachVolunteering =
        await firestore.collection(collectionName).doc(id).get();
    if (!eachVolunteering.exists) {
      return null; 
    }
    return Volunteering(
        id: int.parse(eachVolunteering.id),
        about: eachVolunteering['about'],
        address: eachVolunteering['address'],
        availability: List<String>.from(eachVolunteering['availability'] as List<dynamic>),
        capacity: eachVolunteering['capacity'],
        category: eachVolunteering['category'],
        description: eachVolunteering['description'],
        imageUrl: eachVolunteering['imageUrl'],
        name: eachVolunteering['name'],
        requirements: List<String>.from(eachVolunteering['requirements'] as List<dynamic>),
        volunteerQuantity: eachVolunteering['volunteerQuantity'],
        creationTime: DateTime.now());
  }

  @override
  Future<List<Volunteering>> getVolunteerings() async {
    final List<Volunteering> volunteeringList = [];
    final retrievedData = await firestore.collection(collectionName).get();
    for (var eachVolunteering in retrievedData.docs) {
      Map<String, dynamic> eachVolunteeringData = eachVolunteering.data();
      volunteeringList.add(Volunteering(
          id: int.parse(eachVolunteering.id),
          about: eachVolunteeringData['about'],
          address: eachVolunteeringData['address'],
          availability: List<String>.from(eachVolunteeringData['availability'] as List<dynamic>),
          capacity: eachVolunteeringData['capacity'],
          category: eachVolunteeringData['category'],
          description: eachVolunteeringData['description'],
          imageUrl: eachVolunteeringData['imageUrl'],
          name: eachVolunteeringData['name'],
          requirements: List<String>.from(eachVolunteeringData['requirements'] as List<dynamic>),
          volunteerQuantity: eachVolunteeringData['volunteerQuantity'],
          creationTime: DateTime.now()));
    }
    return volunteeringList;
  }
}
