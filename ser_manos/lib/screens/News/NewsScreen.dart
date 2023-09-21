import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/cells/cards/NewsCard.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/model/News.dart';

class NewsScreen extends HookWidget {
  const NewsScreen({super.key});

  static final newList = List.from([
    const News(
        reportId: 0,
        category: "REPORTE 2820",
        title: "Ser donante voluntario",
        subTitle: "subtitle",
        content:
            "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
        imageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153'),
    const News(
        reportId: 1,
        category: "NOTICIAS DE CUYO",
        title: "Juntamos residuos",
        subTitle: "subtitle",
        content:
            "Voluntarios de Godoy Cruz, se sumaron a la limpieza de un cauce  en las inmediaciones.",
        imageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153'),
    const News(
        reportId: 2,
        subTitle: "subtitle",
        category: "DIARIO LA NACIÓN",
        title: "Adoptar mascotas",
        content:
            "Ayudanos a limpiar las calles de perros callejeros adoptándolos evitando la sobrepoblación de las perreras.",
        imageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153'),
  ]);

  @override
  Widget build(BuildContext context) {
    final controler = useTabController(initialLength: 3);

    return Scaffold(
      appBar: SermanosHeader.tabsHeader(controller: controler),
      body: ListView.builder(
          itemCount: newList.length,
          itemBuilder: (context, index) {
            return Container(
                padding: const EdgeInsets.all(16),
                child: NewsCard(news: newList[index])); 
          }),
    );
  }
}
