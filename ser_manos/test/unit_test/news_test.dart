import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

import 'package:ser_manos/model/News.dart';
import 'package:ser_manos/services/implementations/FirebaseNewsService.dart';

import '../mocked_list/list.dart';

void main() {
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late FirebaseNewsService service;


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
