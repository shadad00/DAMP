import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/model/News.dart';

class newsService {
  const newsService();

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<News>> getNews() async {
    final List<News> newsList = [];
    final retrievedData = await firestore.collection("news").get();
    for (var eachNew in retrievedData.docs) {
      Map<String, dynamic> eachNewData = eachNew.data();
      newsList.add(News(
          reportId: int.parse(eachNew.id),
          category: eachNewData['category'],
          content: eachNewData['content'],
          imageUrl: eachNewData['imageUrl'],
          subTitle: eachNewData['subtitle'],
          title: eachNewData['title'],
          summary: eachNewData['summary']));
    }
    return newsList;
  }

  Future<News> getNewById({required String id}) async {
    final retrievedNew = await firestore.collection("news").doc(id).get();
    //check the id. 
    return News(
          reportId: int.parse(retrievedNew.id),
          category: retrievedNew['category'],
          content: retrievedNew['content'],
          imageUrl: retrievedNew['imageUrl'],
          subTitle: retrievedNew['subtitle'],
          title: retrievedNew['title'],
          summary: retrievedNew['summary']); 
    }
}
