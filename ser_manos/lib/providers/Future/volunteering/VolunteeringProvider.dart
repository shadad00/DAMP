import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../../../model/Volunteering.dart';
import '../../Providers/Providers.dart';





// @riverpod
final getVolunteeringsProvider = FutureProvider<List<Volunteering>>((ref) async {
  final newsRepository = ref.read(volunteeringServiceProvider);
  return await newsRepository.getVolunteerings();
}); 

final getVolunteeringsByIdProvider = FutureProvider.family<Volunteering?, String>((ref, id) async {
  final newsRepository = ref.read(volunteeringServiceProvider);
  return await newsRepository.getVolunteeringById(id: id);
}); 
