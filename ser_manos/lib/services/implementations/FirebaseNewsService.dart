import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/model/News.dart';
import 'package:ser_manos/services/interfaces/NewsService.dart';

class FirebaseNewsService implements NewsService {
  const FirebaseNewsService();

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<News>> getNews() async {
    final List<News> newsList = [];
    final retrievedData = await firestore.collection("news").get();
    for (var eachNew in retrievedData.docs) {
      newsList.add(News.fromJson(newsId: eachNew.id, json: eachNew.data()));
    }
    return newsList;
  }

  @override
  Future<News> getNewById({required String id}) async {
    final retrievedNew = await firestore.collection("news").doc(id).get();
    return News.fromJson(
        newsId: retrievedNew.id,
        json: Map<String, dynamic>.from(
            retrievedNew.data() as Map<String, dynamic>));
  }
}
