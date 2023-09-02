import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/utils/NetworkImageWrapper.dart';
import '../../../model/News.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Column(
            children: [
              NetworkImageWrapper(imageUrl: news.imageUrl)
            ],
          ), 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'REPORTE ${news.reportId}',
                style: const SermanosTypography.overline(
                  color: SermanosColors.neutral75,
                ),
              ),
              Text(
                news.title,
                style: const SermanosTypography.subtitle01(
                  color: SermanosColors.neutral100,
                ),
              ),
              Text(
                news.subtitle,
                style: const SermanosTypography.body02(
                  color: SermanosColors.neutral75,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShortButton(
                loading: false,
                filled: false,
                onPressed: () => {},
                text: "Leer Más",
                textColor: SermanosColors.primary100,
              )
                ],
              )
            ],
          ),
        ],
      );
  }
}
