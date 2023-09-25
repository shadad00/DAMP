import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/shadows/shadows.dart';
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
    return Container(
        height: 172,
        decoration: BoxDecoration(
          color: SermanosColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: SermanosShadows.shadow2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                width: 118,
                child: NetworkImageWrapper(imageUrl: news.imageUrl)),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news.category,
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
                              news.summary,
                              softWrap: true,
                              style: const SermanosTypography.body02(
                                color: SermanosColors.neutral75,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ShortButton(
                              boxColor: SermanosColors.neutral0,
                              loading: false,
                              filled: false,
                              onPressed: () =>
                                  {context.beamToNamed('/news/${news.reportId}')},
                              text: "Leer Más",
                              textColor: SermanosColors.primary100,
                            )
                          ],
                        )
                      ],
                    )))
          ],
        ));
  }
}
