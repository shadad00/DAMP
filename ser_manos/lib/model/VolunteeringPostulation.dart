import 'package:collection/collection.dart';


class VolunteeringPostulation {
  final int volunteeringId;
  final PostulationStatus status;

  const VolunteeringPostulation({required this.volunteeringId, required this.status}); 

  factory VolunteeringPostulation.fromJson({
    required String volunteeringId,
    required Map<String, dynamic> json,
  }) {
    PostulationStatus? s;
    if (json['status'] != null) {
      s = PostulationStatus.getPostulationStatusFromString(json['status']);
    }
    s ??= PostulationStatus.unknown;

    return VolunteeringPostulation(
      volunteeringId: int.parse(volunteeringId),
      status: s,
    );
  }

}

enum PostulationStatus {
  pending,
  accepted,
  unknown;

  static PostulationStatus? getPostulationStatusFromString(String value) {
    PostulationStatus? s = PostulationStatus.values
        .firstWhereOrNull((PostulationStatus element) => element.name == value);
    if (s == null) {
      return PostulationStatus.unknown;
    }
    return s;
  }
}
