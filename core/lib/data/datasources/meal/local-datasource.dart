import 'package:core/data/models/category-detail.dart';
import 'package:core/domain/entities/category-detail.dart';

import '../../../domain/entities/meal-detail.dart';
import '../../../domain/entities/meal.dart';
import '../../models/meal-detail.dart';
import '../../models/meal.dart';

abstract class MealLocalDatasource {
  Future<Iterable<MealModel>> getFavorites();
  Future<Iterable<int>> getFavoritesId();
  Future<int> newFavorite(String idMeal);
  Future<int> removeFavorite(String idMeal);
  Future<Iterable<CategoryDetailModel>> getCategoriesCache();
  Future<void> saveCategories(Iterable<CategoryDetail> categories);
  Future<Iterable<MealModel>> getMealsByCategoryCache(CategoryDetail category);
  Future<void> saveMeals(Iterable<Meal> meals);
  Future<void> saveMeal(MealDetail meal);
  Future<MealDetailModel?> getDetailMeal(String idMeal);
}