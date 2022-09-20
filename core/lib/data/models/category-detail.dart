import 'package:core/data/models/category.dart';
import 'package:core/domain/entities/category-detail.dart';

class CategoryDetailModel extends CategoryModel {
  final String id;
  final String thumbnail;
  final String description;

  CategoryDetailModel({
    required super.name,
    required this.id,
    required this.description,
    required this.thumbnail,
  });

  factory CategoryDetailModel.fromJsonRemote(Map m) => CategoryDetailModel(
    name: m['strCategory'],
    id: m['idCategory'],
    description: m['strCategoryDescription'],
    thumbnail: m['strCategoryThumb']
  );

  @override
  CategoryDetail get toEntity => CategoryDetail(
    id: id,
    name: name,
    thumbnail: thumbnail,
    description: description,
  );
}