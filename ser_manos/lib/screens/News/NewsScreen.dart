import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/cells/cards/NewsCard.dart';
import 'package:ser_manos/model/News.dart';
import 'package:ser_manos/providers/news%20/newsProviders.dart';
import 'package:ser_manos/services/newsService.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  // static final newList = List.from([
  //   const News(
  //       reportId: 0,
  //       category: "REPORTE 2820",
  //       title: "Ser donante voluntario",
  //       subTitle: "subtitle",
  //       content:
  //           "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
  //       imageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153'),
  //   const News(
  //       reportId: 1,
  //       category: "NOTICIAS DE CUYO",
  //       title: "Juntamos residuos",
  //       subTitle: "subtitle",
  //       content:
  //           "Voluntarios de Godoy Cruz, se sumaron a la limpieza de un cauce  en las inmediaciones.",
  //       imageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153'),
  //   const News(
  //       reportId: 2,
  //       subTitle: "subtitle",
  //       category: "DIARIO LA NACIÓN",
  //       title: "Adoptar mascotas",
  //       content:
  //           "Ayudanos a limpiar las calles de perros callejeros adoptándolos evitando la sobrepoblación de las perreras.",
  //       imageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153'),
  // ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsRetriever = ref.watch(newsRetrieverProvider);

    return newsRetriever.when(
        data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.all(16),
                  child: NewsCard(news: data[index]));
            }),
        loading: () => const Text("loading"),
        error: (error, stackTrace) => const Text("Error"));
  }
}
