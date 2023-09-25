import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/News.dart';
import '../../services/newsService.dart';

final newsRepositoryProvider =
    Provider<newsService>((ref) => const newsService());
// @Riverpod(keepAlive: true)
// newsService newsRepository(newsService ref) => const newsService();

// @riverpod
final newsRetrieverProvider = FutureProvider<List<News>>((ref) async {
  final newsRepository = ref.read(newsRepositoryProvider);
  return await newsRepository.getNews();
}); 
