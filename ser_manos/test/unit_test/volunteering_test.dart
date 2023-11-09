import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:ser_manos/model/Volunteering.dart';
import 'package:ser_manos/services/implementations/FirebaseVolunteeringService.dart';

void main() {
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late FirebaseVolunteeringService service;

  final volunteeringList = [
    Volunteering(
        id: 1,
        name: "Voluntariado 1",
        category: "Categoría 1",
        description: "Descripción 1",
        about: "Acerca de 1",
        address: "Dirección 1",
        requirements: const ["Requerimiento 1"],
        availability: const ["Disponibilidad 1"],
        lat: 1.0,
        long: 1.0,
        imageUrl: "http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153",
        capacity: 10,
        volunteerQuantity: 1,
        creationTime: DateTime.now()),
    Volunteering(
        id: 2,
        name: "Voluntariado 2",
        category: "Categoría 2",
        description: "Descripción 2",
        about: "Acerca de 2",
        address: "Dirección 2",
        requirements: const ["Requerimiento 2"],
        availability: const ["Disponibilidad 2"],
        lat: 2.0,
        long: 2.0,
        imageUrl: "http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153",
        capacity: 10,
        volunteerQuantity: 1,
        creationTime: DateTime.now())
  ];

  setUpAll(() async {
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    service = FirebaseVolunteeringService(
      firestore: fakeFirebaseFirestore,
    );

    for (final volunteering in volunteeringList) {
      final mockDocumentReference = fakeFirebaseFirestore
          .collection("volunteering")
          .doc(volunteering.id.toString());
      await mockDocumentReference.set(volunteering.toMap());
    }
  });

  test("get all volunteerings.",
      () async => expect(await service.getVolunteerings(), volunteeringList));

  test("get volunteering by id.", () async {
    for (final vol in volunteeringList) {
      expect(await service.getVolunteeringById(id: vol.id.toString()), vol);
    }
  });

  test("decrement volunteeringQuantity.", () async {
    for (final volunteering in volunteeringList) {
      int oldQuantity = volunteering.volunteerQuantity;
      await service.decrementVolunteerQuantity(volunteering.id);
      final retrievedVolunteering =
          await service.getVolunteeringById(id: volunteering.id.toString());
      if (retrievedVolunteering == null) {
        fail("Invalid volunteering retrieval.");
      }
      expect(retrievedVolunteering.volunteerQuantity, oldQuantity - 1);
    }
  });

  test("increment volunteeringQuantity.", () async {
    for (final volunteering in volunteeringList) {
      int oldQuantity = volunteering.volunteerQuantity - 1;
      await service.incrementVolunteerQuantity(volunteering.id);
      final retrievedVolunteering =
          await service.getVolunteeringById(id: volunteering.id.toString());
      if (retrievedVolunteering == null) {
        fail("Invalid volunteering retrieval.");
      }
      expect(retrievedVolunteering.volunteerQuantity, oldQuantity + 1);
    }
  });

  test("increment full volunteering.", () async {
    final fullVolunteering = Volunteering(
        id: 3,
        name: "Voluntariado 3",
        category: "Categoría 3",
        description: "Descripción 3",
        about: "Acerca de 3",
        address: "Dirección 3",
        requirements: const ["Requerimiento 3"],
        availability: const ["Disponibilidad 3"],
        lat: 3.0,
        long: 3.0,
        imageUrl: "http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153",
        capacity: 1,
        volunteerQuantity: 1,
        creationTime: DateTime.now());
    final mockDocumentReference = fakeFirebaseFirestore
        .collection("volunteering")
        .doc(fullVolunteering.id.toString());
    await mockDocumentReference.set(fullVolunteering.toMap());

    int oldQuantity = fullVolunteering.volunteerQuantity;
    await service.incrementVolunteerQuantity(fullVolunteering.id);
    final retrievedVolunteering =
        await service.getVolunteeringById(id: fullVolunteering.id.toString());
    if (retrievedVolunteering == null) {
      fail("Invalid volunteering retrieval.");
    }
    expect(retrievedVolunteering.volunteerQuantity, oldQuantity);
  });

  test("decrement empty volunteering.", () async {
    final emptyVolunteering = Volunteering(
        id: 4,
        name: "Voluntariado 4",
        category: "Categoría 4",
        description: "Descripción 4",
        about: "Acerca de 4",
        address: "Dirección 4",
        requirements: const ["Requerimiento 4"],
        availability: const ["Disponibilidad 4"],
        lat: 4.0,
        long: 4.0,
        imageUrl: "http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153",
        capacity: 1,
        volunteerQuantity: 0,
        creationTime: DateTime.now());
    final mockDocumentReference = fakeFirebaseFirestore
        .collection("volunteering")
        .doc(emptyVolunteering.id.toString());
    await mockDocumentReference.set(emptyVolunteering.toMap());

    int oldQuantity = emptyVolunteering.volunteerQuantity;
    await service.decrementVolunteerQuantity(emptyVolunteering.id);
    final retrievedVolunteering =
        await service.getVolunteeringById(id: emptyVolunteering.id.toString());
    if (retrievedVolunteering == null) {
      fail("Invalid volunteering retrieval.");
    }
    expect(retrievedVolunteering.volunteerQuantity, oldQuantity);
  });
}
