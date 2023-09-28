import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/News.dart';
import '../../services/implementations/FirebaseNewsService.dart';

final newsRepositoryProvider =
    Provider<FirebaseNewsService>((ref) => const FirebaseNewsService());
// @Riverpod(keepAlive: true)
// newsService newsRepository(newsService ref) => const newsService();

// @riverpod
final newsRetrieverProvider = FutureProvider<List<News>>((ref) async {
  final newsRepository = ref.read(newsRepositoryProvider);
  return await newsRepository.getNews();
});

final newByIdRetrieverProvider =
    FutureProvider.family<News, String>((ref, id) async {
  final newsRepository = ref.read(newsRepositoryProvider);
  return await newsRepository.getNewById(id: id);
});
