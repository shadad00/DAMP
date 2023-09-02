import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import 'package:ser_manos/design_system/molecules/components/vacancies.dart';

class Volunteeering_card extends StatelessWidget {
  final String title;
  final int vacancy;
  final String category;
  final ImageProvider image;

  const Volunteeering_card({
    super.key,
    required this.title,
    required this.vacancy,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Image(image: image),
        Text(category),
        Text(title),
        Row(
          children: [
            Vacancies(vacancy: vacancy),
            SermanosIcons.favoriteOutlined(status: SermanosIconStatus.activated
                // TODO deshardcodear
                ),
          ],
        )
      ],
    ));
  }
}
