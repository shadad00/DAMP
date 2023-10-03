import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/News.dart';
import '../../Providers/Providers.dart';

part 'generated/NewsProviders.g.dart';

@Riverpod(keepAlive: true)
Future<List<News>> newsRetriever(NewsRetrieverRef ref) async {
  final newsRepository = ref.read(newsServiceProvider);
  return await newsRepository.getNews();
}

@Riverpod(keepAlive: true)
Future<News?> newByIdRetriever(NewByIdRetrieverRef ref,
    {required String id}) async {
  final newsService = ref.read(newsServiceProvider);
  return await newsService.getNewById(id: id);
}
