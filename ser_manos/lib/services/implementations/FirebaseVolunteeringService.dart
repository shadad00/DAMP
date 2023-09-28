import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/model/Volunteering.dart';
import '../interfaces /VolunteeringService.dart';

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
            retrievedVolunteering.data() as Map<String, dynamic>) 
      ); 
  }

  @override
  Future<List<Volunteering>> getVolunteerings() async {
    final List<Volunteering> volunteeringList = [];
    final retrievedData = await firestore.collection(collectionName).get();
    for (var eachVolunteering in retrievedData.docs) {
      volunteeringList.add(Volunteering.fromJson(
        volunteeringId: eachVolunteering.id, 
        eachVolunteering: eachVolunteering.data())
      );
    }
    return volunteeringList;
  }
}
