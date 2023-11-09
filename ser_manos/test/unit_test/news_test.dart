import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

import 'package:ser_manos/model/News.dart';
import 'package:ser_manos/services/implementations/FirebaseNewsService.dart';

void main() {
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late FirebaseNewsService service;
  final newsList = [
    const News(
        reportId: 1,
        title: "Title 1",
        subTitle: "Subtitle 1",
        summary: "Summary 1",
        content: "Content 1",
        category: "Category 1",
        imageUrl: "http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153"),
    const News(
        reportId: 2,
        title: "Title 2",
        subTitle: "Subtitle 2",
        summary: "Summary 2",
        content: "Content 2",
        category: "Category 2",
        imageUrl: "http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153"),
  ];

  setUpAll(() async {
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    service = FirebaseNewsService(
      firestore: fakeFirebaseFirestore,
    );

    for (final news in newsList) {
      final mockDocumentReference = fakeFirebaseFirestore
          .collection("news")
          .doc(news.reportId.toString());
      await mockDocumentReference.set(news.toMap());
    }
  });

  test("get all news.", () async => expect(await service.getNews(), newsList));

  test("retrieve new by Id." , () async {
    for (int i = 0; i < newsList.length; i++) {
      final News retrievedNew = await service.getNewById(id: newsList[i].reportId.toString());
      expect(retrievedNew, newsList[i]);
    }
  });


}
