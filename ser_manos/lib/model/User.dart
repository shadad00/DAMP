import 'package:equatable/equatable.dart';
import 'package:ser_manos/model/Gender.dart';

class ApplicationUser extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String? phone;
  final Gender? gender;
  final DateTime? birthdate;
  final String? profileImageUrl;
  final String? emailContact;

  const ApplicationUser({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    this.phone,
    this.gender,
    this.birthdate,
    this.profileImageUrl,
    this.emailContact,
  });

  bool isProfileFilled() {
    return birthdate != null &&
        phone != null &&
        gender != null &&
        profileImageUrl != null &&
        emailContact != null;
  }

  String getFullName() {
    return '${name ?? ""} ${surname ?? ""}'.trim();
  }

  @override
  List<Object?> get props => [id, email];
}
