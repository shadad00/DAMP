import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/molecules/components/vacancies.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/shimmer/PictureShimmer.dart';
import 'package:ser_manos/model/Volunteering.dart';

class VolunteeringDescriptionScreen extends StatelessWidget {
  const VolunteeringDescriptionScreen({super.key});

  static final Volunteering volunteeringInformation = Volunteering(
      id: "0",
      name: "Un techo para mi País",
      category: "Accion social",
      description:
          '''El propósito principal de "Un techo para mi país" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.''',
      about:
          '''Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.''',
      address: "Libertador y udaondo",
      requirements: const ["Mayor de edad.", "Poder levantar cosas pesadas."],
      availability: const ["Mayor de edad.", "Poder levantar cosas pesadas."],
      imageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153',
      capacity: 15,
      volunteerQuantity: 5,
      creationTime: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColoredBox(
              color: SermanosColors.neutral200,
              child: SafeArea(
                top: true,
                bottom: false,
                left: false,
                right: false,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: volunteeringInformation.imageUrl,
                      height: 243,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorWidget: (BuildContext context, String s, dynamic) {
                        return ColoredBox(
                          color: SermanosColors.neutral0,
                          child: Image.asset(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            "assets/images/notFound.png",
                            height: 243,
                          ),
                        );
                      },
                      placeholder: (BuildContext context, String url) {
                        return const PictureShimmer(rounded: false);
                      },
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: SermanosColors.neutral0,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              SermanosColors.neutral200,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.3555],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: IconButton(
                        padding: const EdgeInsets.all(16),
                        onPressed: () {},
                        icon:
                            SermanosIcons.back(status: SermanosIconStatus.back),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        volunteeringInformation.category.toUpperCase(),
                        style: const SermanosTypography.overline(
                          color: SermanosColors.neutral75,
                        ),
                      ),
                      Text(volunteeringInformation.name,
                          style: const SermanosTypography.headline01()),
                      const SizedBox(height: 16),
                      Text(
                        volunteeringInformation.description,
                        style: const SermanosTypography.subtitle01(
                          color: SermanosColors.secondary200,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Sobre la actividad",
                        style: SermanosTypography.headline02(
                          color: SermanosColors.neutral100,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        volunteeringInformation.about,
                        style: const SermanosTypography.body01(),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Participar del voluntariado",
                        style: SermanosTypography.headline02(
                          color: SermanosColors.neutral100,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Requisitos",
                        style: SermanosTypography.subtitle01(),
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: volunteeringInformation.requirements.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: SermanosColors.neutral100,
                                size: 5,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                volunteeringInformation.requirements[index],
                                style: const SermanosTypography.body01(),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Disponibilidad",
                        style: SermanosTypography.subtitle01(),
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: volunteeringInformation.availability.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: SermanosColors.neutral100,
                                size: 5,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                volunteeringInformation.availability[index],
                                style: const SermanosTypography.body01(),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Vacancies(
                        vacancy: volunteeringInformation.capacity -
                            volunteeringInformation.volunteerQuantity,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    children: [
                      CtaButton(
                          text: "Postularme", onPressed: () {}, filled: true)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
