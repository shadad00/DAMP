

import 'package:ser_manos/model/Volunteering.dart';

abstract interface class VolunteeringService {

  Future<Volunteering?> getVolunteeringById({required String id}) ; 

  Future<List<Volunteering>> getVolunteerings(); 

  Future<List<Volunteering>> getVolunteeringsByName({required String name}); 

}