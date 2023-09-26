import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/providers/news%20/newsProviders.dart';

import '../../design_system/tokens/colours/colours.dart';

class NewDescriptionScreen extends ConsumerWidget {
  final String newsId; 

  const NewDescriptionScreen({super.key ,required this.newsId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsRetriever = ref.watch(newByIdRetrieverProvider(newsId));

    return newsRetriever.when(
        loading: () => const Text("Loading"),
        error: (error, stackTrace) => const Text("Error"),
        data: (data) => Scaffold(
              appBar: SermanosHeader.sectionHeader(title: "Novedades"),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Text(
                        data.category.toUpperCase(),
                        style: const SermanosTypography.overline(
                          color: SermanosColors.neutral75,
                        ),
                      ),
                      Text(
                        data.title,
                        style: const SermanosTypography.headline02(
                          color: SermanosColors.neutral100,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CachedNetworkImage(imageUrl: data.imageUrl),
                      const SizedBox(height: 16),
                      Text(
                        data.subTitle,
                        style: const SermanosTypography.subtitle01(
                          color: SermanosColors.secondary200,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        data.content,
                        style: const SermanosTypography.body01(
                            color: SermanosColors.neutral100),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Comparte esta nota",
                        style: SermanosTypography.headline02(
                            color: SermanosColors.neutral100),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      CtaButton(
                          text: "Compartir", onPressed: () {}, filled: true)
                    ])),
              ),
            ));
  }
}
