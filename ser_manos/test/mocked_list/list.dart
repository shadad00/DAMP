import 'package:ser_manos/model/News.dart';
import 'package:ser_manos/model/Volunteering.dart';

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