import 'package:ser_manos/model/News.dart';
import 'package:ser_manos/providers/Future/news/NewsProvider.dart';

import '../../mocked_list/list.dart';

Future<List<News>> getNewsMock(GetNewsRef ref) async {
  return newsList; 
}
