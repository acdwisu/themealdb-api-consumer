import 'package:core/data/models/model.dart';
import '../../domain/entities/category.dart';

class CategoryModel implements Model<Category> {
  final String name;

  CategoryModel({required this.name});
  
  factory CategoryModel.fromJsonRemote(Map m) => CategoryModel(
    name: m['strCategory'],
  );

  @override
  Category get toEntity => Category(name: name);
}