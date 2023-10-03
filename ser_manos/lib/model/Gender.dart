import 'package:collection/collection.dart';

enum Gender {
  male("Hombre"),
  female("Mujer"),
  noBinary("No binario");

  const Gender(this.text);

  final String text;

  static Gender? getGenderFromString(String? value) {
    if (value == null) return null; 
    Gender? g = Gender.values
        .firstWhereOrNull((Gender element) => element.name == value);
    return g;
  }
}
