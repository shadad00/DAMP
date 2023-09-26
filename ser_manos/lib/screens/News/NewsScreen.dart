import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/cells/cards/NewsCard.dart';
import 'package:ser_manos/model/News.dart';
import 'package:ser_manos/providers/news%20/NewsProviders.dart';
import 'package:ser_manos/services/NewsService.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

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
