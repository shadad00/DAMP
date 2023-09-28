import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/services/implementations/FirebaseVolunteeringService.dart';
import 'package:ser_manos/services/interfaces%20/VolunteeringService.dart';

import '../../model/Volunteering.dart';


final volunteeringServiceProvider =
    Provider<VolunteeringService>((ref) => const FirebaseVolunteeringService());


// @riverpod
final getVolunteeringsProvider = FutureProvider<List<Volunteering>>((ref) async {
  final newsRepository = ref.read(volunteeringServiceProvider);
  return await newsRepository.getVolunteerings();
}); 

final getVolunteeringsByIdProvider = FutureProvider.family<Volunteering?, String>((ref, id) async {
  final newsRepository = ref.read(volunteeringServiceProvider);
  return await newsRepository.getVolunteeringById(id: id);
}); 
