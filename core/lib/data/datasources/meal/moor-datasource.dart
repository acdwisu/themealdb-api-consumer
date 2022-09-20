import 'package:core/data/datasources/meal/moor-helper/database.dart';
import 'package:core/data/models/category-detail.dart';

import 'package:core/data/models/meal-detail.dart';

import 'package:core/domain/entities/category-detail.dart';
import 'package:core/domain/entities/meal-detail.dart';

import 'package:core/domain/entities/meal.dart';

import '../../models/meal.dart';
import 'local-datasource.dart';

class MealMoorDatasource extends MealLocalDatasource {
  final MealDatabase mealDatabase;

  MealMoorDatasource({required this.mealDatabase});

  @override
  Future<Iterable<CategoryDetailModel>> getCategoriesCache() {
    return mealDatabase.getCategories();
  }

  @override
  Future<Iterable<MealModel>> getFavorites() {
    return mealDatabase.getFavoriteMeals();
  }

  @override
  Future<Iterable<MealModel>> getMealsByCategoryCache(CategoryDetail category) {
    return mealDatabase.getCachedMealsByCategory(category.name);
  }

  @override
  Future<int> newFavorite(String idMeal) {
    return mealDatabase.newFavorite(idMeal);
  }

  @override
  Future<int> removeFavorite(String idMeal) {
    return mealDatabase.deleteFavorite(idMeal);
  }

  @override
  Future<void> saveCategories(Iterable<CategoryDetail> categories) {
    return mealDatabase.saveCategories(categories);
  }

  @override
  Future<void> saveMeals(Iterable<Meal> meals) {
    return mealDatabase.saveMeals(meals);
  }

  @override
  Future<Iterable<int>> getFavoritesId() {
    return mealDatabase.getFavoritedMealsId();
  }

  @override
  Future<MealDetailModel?> getDetailMeal(String idMeal) {
    return mealDatabase.getDetailMeal(idMeal);
  }

  @override
  Future<void> saveMeal(MealDetail meal) {
    return mealDatabase.saveMeal(meal);
  }

}