import 'category.dart';

class CategoryDetail extends Category {
  final String id;
  final String thumbnail;
  final String description;

  CategoryDetail({
    required this.id,
    required super.name,
    required this.thumbnail,
    required this.description,
  });
}