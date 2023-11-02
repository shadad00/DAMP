import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/providers/Providers/Providers.dart';

part 'generated/VolunteeringList.g.dart';

@Riverpod()
class VolunteeringList extends _$VolunteeringList {
  @override
  List<int>? build() {
    final ApplicationUser user = ref.read(currentUserProvider)!;
    return user.favorites;
  }

  void addFavorite(int newFavoriteId) async {
    final ApplicationUser user = ref.read(currentUserProvider)!;
    user.addFavoriteVolunteering(newFavoriteId);
    ref.read(userServiceProvider).updateFavoriteList(
        userId: user.id, volunteerings: user.getFavorites());
    state = List.from(user.getFavorites()!);
  }

  void removeFavorite(int favoriteToRemoveId) async{
    final ApplicationUser user = ref.read(currentUserProvider)!;
    user.removeFavoriteVolunteering(favoriteToRemoveId);
    ref.read(userServiceProvider).updateFavoriteList(
        userId: user.id, volunteerings: user.getFavorites());
    state = List.from(user.getFavorites()!);
  }
}
