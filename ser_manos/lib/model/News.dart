import 'package:equatable/equatable.dart';

class News extends Equatable {
  final int reportId;
  final String title;
  final String subtitle;
  final String imageUrl;
 
  const News({
    required this.reportId,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [reportId];
}