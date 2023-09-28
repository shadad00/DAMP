import 'package:ser_manos/model/News.dart';

abstract interface class NewsService {

  Future<News?> getNewById({required String id}) ; 

  Future<List<News>> getNews(); 

}