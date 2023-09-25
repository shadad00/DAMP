import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/model/News.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<List<News>> getNews() async {
  final List<News> newsList = [];
  final retrievedData = await FirebaseFirestore.instance.collection("news").get();
  for (var eachNew in retrievedData.docs) {
    Map<String, dynamic> eachNewData = eachNew.data();
    newsList.add(News(
      reportId: int.parse(eachNew.id),
      category: eachNewData['category'],
      content: eachNewData['content'],
      imageUrl: eachNewData['imageUrl'],
      subTitle: eachNewData['subtitle'],
      title: eachNewData['title'],
    ));
  }
  return newsList;
}
