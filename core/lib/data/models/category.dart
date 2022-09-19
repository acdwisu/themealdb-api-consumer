import 'package:core/data/models/model.dart';
import 'package:core/domain/entities/area.dart';
import '../../domain/entities/category.dart';

class CategoryModel extends Model<Category> {
  final String name;

  CategoryModel({required this.name});
  
  factory CategoryModel.fromJsonRemote(Map m) => CategoryModel(
    name: m['strCategory'],
  );

  @override
  Category get toEntity => Category(name: name);
}