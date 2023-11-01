import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/PathProvider.g.dart';

@Riverpod()
class Path extends _$Path {
  @override
  String? build() {
    return null;
  }

  void update(String? path) {
    state = path;
  }

  bool wasProvided() {
    return state != null; 
  }
}
