import 'package:ser_manos/model/Volunteering.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';
import 'package:ser_manos/providers/Notifier/Volunteering/VolunteeringList.dart';

import '../../mocked_list/list.dart';

class VolunteeringListMock extends VolunteeringList {
  @override
  List<int> build() {
    return [1];
  }
}


Future<List<Volunteering>> getVolunteeringsMock(GetVolunteeringsRef ref) async{
  return volunteeringList; 
}
