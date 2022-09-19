import 'package:core/data/models/category.dart';
import 'package:core/data/models/meal.dart';
import 'package:core/domain/entities/category.dart';

abstract class MealRemoteDatasource {
  Future<Iterable<MealModel>> getMealsByCategory(Category category);
  Future<Iterable<MealModel>> searchMealsByQuery(String query);
  Future<Iterable<CategoryModel>> getCategories();
}