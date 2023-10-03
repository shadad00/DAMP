import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/News.dart';
import '../../Providers/Providers.dart';


// @Riverpod(keepAlive: true)
// newsService newsRepository(newsService ref) => const newsService();

// @riverpod
final newsRetrieverProvider = FutureProvider<List<News>>((ref) async {
  final newsRepository = ref.read(newsServiceProvider);
  return await newsRepository.getNews();
});

final newByIdRetrieverProvider =
    FutureProvider.family<News?, String>((ref, id) async {
  final newsService = ref.read(newsServiceProvider);
  return await newsService.getNewById(id: id);
});
