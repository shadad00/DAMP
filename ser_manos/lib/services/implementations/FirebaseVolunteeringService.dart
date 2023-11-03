import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/model/Volunteering.dart';
import '../interfaces/VolunteeringService.dart';

class FirebaseVolunteeringService implements VolunteeringService {
  const FirebaseVolunteeringService();

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static const String collectionName = "volunteering";

  @override
  Future<Volunteering?> getVolunteeringById({required String id}) async {
    final retrievedVolunteering =
        await firestore.collection(collectionName).doc(id).get();
    if (!retrievedVolunteering.exists) {
      return null;
    }
    return Volunteering.fromJson(
        volunteeringId: retrievedVolunteering.id,
        eachVolunteering: Map<String, dynamic>.from(
            retrievedVolunteering.data() as Map<String, dynamic>));
  }

  @override
  Future<List<Volunteering>> getVolunteerings() async {
    final List<Volunteering> volunteeringList = [];
    final retrievedData = await firestore.collection(collectionName).get();
    for (var eachVolunteering in retrievedData.docs) {
      volunteeringList.add(Volunteering.fromJson(
          volunteeringId: eachVolunteering.id,
          eachVolunteering: eachVolunteering.data()));
    }
    return volunteeringList;
  }

  @override
  Future<List<Volunteering>> getVolunteeringsByName(
      {required String name}) async {
    final List<Volunteering> volunteeringList = [];

    final lowercaseName = name.toLowerCase();

    final retrievedData = await firestore.collection(collectionName).get();

    for (var eachVolunteering in retrievedData.docs) {
      if (eachVolunteering
          .data()['name']
          .toString()
          .toLowerCase()
          .contains(lowercaseName)) {
        volunteeringList.add(Volunteering.fromJson(
          volunteeringId: eachVolunteering.id,
          eachVolunteering: eachVolunteering.data(),
        ));
      }
    }

    return volunteeringList;
  }



  @override
  Future<void> decrementVolunteerQuantity(int volunteeringId) async {
    final Volunteering? relatedVolunteering =
        await getVolunteeringById(id: volunteeringId.toString());
    if (relatedVolunteering == null) {
      return;
    }
    int newQuantity = relatedVolunteering.volunteerQuantity - 1;
    if (_validNewQuantity(relatedVolunteering, newQuantity)) {
      return _changeVolunteerQuantity(relatedVolunteering.id, newQuantity); 
    }
  }

  @override 
  Future<void> incrementVolunteerQuantity(int volunteeringId) async {
    final Volunteering? relatedVolunteering =
        await getVolunteeringById(id: volunteeringId.toString());
    if (relatedVolunteering == null) {
      return;
    }
    int newQuantity = relatedVolunteering.volunteerQuantity + 1;
    if (_validNewQuantity(relatedVolunteering, newQuantity)) {
      return _changeVolunteerQuantity(relatedVolunteering.id, newQuantity); 
    }
  }



  Future<void> _changeVolunteerQuantity(
      int volunteeringId, int newQuantity) async {
    try {
      final query =
          firestore.collection(collectionName).doc(volunteeringId.toString());
      final dataMap = {
        'volunteerQuantity': newQuantity,
      };
      await query.update(dataMap);
    } catch (e) {
      throw Exception();
    }
  }

  bool _validNewQuantity(Volunteering volunteering, int newQuantity) {
    return  0 <= newQuantity &&  newQuantity <= volunteering.capacity;
  }

}
