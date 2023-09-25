import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String category;
  final String title;
  final String subTitle;
  final int reportId;
  final String content;
  final String imageUrl;
  final String summary; 

  const News({
    required this.reportId,
    required this.category,
    required this.subTitle,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.summary
  });

  @override
  List<Object?> get props => [reportId];

  @override
  String toString() {
    return title;
  }
}
