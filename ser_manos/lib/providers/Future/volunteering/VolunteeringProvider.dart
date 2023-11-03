import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/Volunteering.dart';
import '../../Providers/Providers.dart';

part 'generated/VolunteeringProvider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Volunteering>> getVolunteerings(GetVolunteeringsRef ref) async {
  final newsRepository = ref.read(volunteeringServiceProvider);
  return await newsRepository.getVolunteerings();
}

@Riverpod(keepAlive: true)
Future<Volunteering?> getVolunteeringById(GetVolunteeringByIdRef ref,
    {required String id}) async {
  final newsRepository = ref.read(volunteeringServiceProvider);
  return await newsRepository.getVolunteeringById(id: id);
}

// @Riverpod(keepAlive: true)
// Future<List<Volunteering>> getVolunteeringsByName(GetVolunteeringsByNameRef ref, {required String volunteeringName, String? searchQuery}) async {
//   final newsRepository = ref.read(volunteeringServiceProvider);

//   if (volunteeringName.isEmpty || volunteeringName == '') {
//     return getVolunteerings(ref);
//   }
//   final allVolunteerings = await newsRepository.getVolunteeringsByName(name: volunteeringName);
//   return allVolunteerings;
// }
