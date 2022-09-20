import 'package:core/data/models/category-detail.dart';
import 'package:core/data/models/meal-detail.dart';
import 'package:core/data/models/meal.dart';
import 'package:core/domain/entities/category-detail.dart';

abstract class MealRemoteDatasource {
  Future<Iterable<MealModel>> getMealsByCategory(CategoryDetail category);
  Future<Iterable<MealDetailModel>> searchMealsByQuery(String query);
  Future<Iterable<CategoryDetailModel>> getCategories();
  Future<MealDetailModel?> getDetailMeal(String idMeal);
}