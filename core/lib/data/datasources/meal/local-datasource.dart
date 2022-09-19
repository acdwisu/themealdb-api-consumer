import 'package:core/data/models/category.dart';
import 'package:core/domain/entities/category.dart';

import '../../../domain/entities/meal.dart';
import '../../models/meal.dart';

abstract class MealLocalDatasource {
  Future<Iterable<MealModel>> getFavorites();
  Future<int> newFavorite(Meal meal);
  Future<int> removeFavorite(String idMeal);
  Future<Iterable<CategoryModel>> getCategoriesCache();
  Future<void> saveCategories(Iterable<Category> categories);
  Future<Iterable<MealModel>> getMealsByCategoryCache(Category category);
  Future<void> saveMeals(Iterable<Meal> meals);
}