import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';

import '../../mocked_list/list.dart';

class CurrentUserMock extends CurrentUser {

  @override
  ApplicationUser? build() {
    return mockedUser;
  }  

}
