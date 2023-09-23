import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/cells/cards/VolunteeringCards/VolunteeringCard.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/inputs/SermanosSearchBar.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/model/Volunteering.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Volunteering> volunteersList = List.from([
    Volunteering(
        id: "0",
        name: "Un techo para mi pais",
        category: "Accion social",
        description: "Es para construir casas.",
        about: "Mas de lo mismo",
        address: "Libertador y udaondo",
        requirements: const ["ayudante"],
        availability: const ["Disponible"],
        imageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153',
        capacity: 15,
        volunteerQuantity: 54,
        creationTime: DateTime.now()),
    Volunteering(
        id: "0",
        name: "Manos caritativas",
        category: "Accion social",
        description: "Es para usar las manos .",
        about: "Un poco mas de lo que se esperaba antes",
        address: "Libertador y udaondo",
        requirements: const ["ayudante"],
        availability: const ["Disponible"],
        imageUrl: 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153',
        capacity: 15,
        volunteerQuantity: 5,
        creationTime: DateTime.now())
  ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          SermanosSearchBar(
            onChanged: (p0) => {},
          ),
          const SizedBox(
            height: 16,
          ),
          const Text("Voluntariados",
              style: SermanosTypography.headline01(
                  color: SermanosColors.neutral100)),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: volunteersList.length,
            itemBuilder: (context, index) {
              return VolunteeringCard(
                  volunteeringInformation: volunteersList[index]);
            },
          ))
        ],
      ),
    );
  }
}
