import 'package:equatable/equatable.dart';

class News extends Equatable {
  final int reportId;
  final String title;
  final String category;
  final String content;
  final String imageUrl;

  const News({
    required this.reportId,
    required this.category,
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [reportId];
}
