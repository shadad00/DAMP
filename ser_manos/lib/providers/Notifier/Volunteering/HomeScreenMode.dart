import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/HomeScreenMode.g.dart';

enum viewModes{
  list,
  carrusel
}

@Riverpod(keepAlive: true)
class HomeScreenMode extends _$HomeScreenMode {
  @override
  viewModes? build() {
    return viewModes.list;
  }

  void changeMode() {
    if (state == viewModes.list) {
      state = viewModes.carrusel;
    } else {
      state = viewModes.list;
    }
  }
}