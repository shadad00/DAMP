import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/model/News.dart';

import '../../design_system/tokens/colours/colours.dart';

class NewDescriptionScreen extends StatelessWidget {
  const NewDescriptionScreen({super.key});

  static const News detailedNew = News(
      reportId: 1,
      category: "reporte 2820",
      subTitle:
          "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
      title: "Ser donante voluntario",
      content:
          '''En un esfuerzo por concienciar sobre la necesidad constante de sangre y sus componentes, el Hospital Centenario destaca la importancia de convertirse en un donante voluntario. La donación de sangre es un acto solidario y altruista que puede salvar vidas y mejorar la salud de aquellos que enfrentan enfermedades graves o accidentes.
La donación voluntaria de sangre desempeña un papel vital en el sistema de salud. A diferencia de la donación de sangre por reposición, donde se solicita a familiares y amigos donar para un paciente específico, la donación voluntaria se realiza sin ninguna conexión directa con un receptor particular. Esto garantiza un suministro constante y seguro de sangre y productos sanguíneos para todos aquellos que lo necesiten.
Los beneficios de ser donante voluntario son numerosos. Además de la satisfacción de ayudar a quienes más lo necesitan, la donación de sangre tiene beneficios para la salud del propio donante. Al donar sangre, se realiza un chequeo médico que incluye pruebas para detectar enfermedades transmisibles, lo que puede proporcionar una evaluación temprana y ayuda en el diagnóstico de posibles problemas de salud.
''',
      imageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SermanosHeader.sectionHeader(title: "Novedades"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Text(
                detailedNew.category.toUpperCase(),
                style: const SermanosTypography.overline(
                  color: SermanosColors.neutral75,
                ),
              ),
              Text(
                detailedNew.title,
                style: const SermanosTypography.headline02(
                  color: SermanosColors.neutral100,
                ),
              ),
              const SizedBox(height: 16),
              CachedNetworkImage(imageUrl: detailedNew.imageUrl),
              const SizedBox(height: 16),
              Text(
                detailedNew.subTitle,
                style: const SermanosTypography.subtitle01(
                  color: SermanosColors.secondary200,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                detailedNew.content,
                style: const SermanosTypography.body01(
                  color: SermanosColors.neutral100
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Comparte esta nota",
                style: SermanosTypography.headline02(
                  color: SermanosColors.neutral100
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              CtaButton(text: "Compartir", onPressed: () {}, filled: true)
            ])),
      ),
    );
  }
}
