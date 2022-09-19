import 'package:core/data/datasources/meal/moor-helper/database.dart';
import 'package:core/data/models/category.dart';

import 'package:core/data/models/meal.dart';

import 'package:core/domain/entities/category.dart';

import 'package:core/domain/entities/meal.dart';

import 'local-datasource.dart';

class MealMoorDatasource extends MealLocalDatasource {
  final MealDatabase mealDatabase;

  MealMoorDatasource({required this.mealDatabase});

  @override
  Future<Iterable<CategoryModel>> getCategoriesCache() {
    return mealDatabase.getCategories();
  }

  @override
  Future<Iterable<MealModel>> getFavorites() {
    return mealDatabase.getFavoriteMeals();
  }

  @override
  Future<Iterable<MealModel>> getMealsByCategoryCache(Category category) {
    return mealDatabase.getCachedMealsByCategory(category.name);
  }

  @override
  Future<int> newFavorite(Meal meal) {
    return mealDatabase.newFavorite(meal.id);
  }

  @override
  Future<int> removeFavorite(String idMeal) {
    return mealDatabase.deleteFavorite(idMeal);
  }

  @override
  Future<void> saveCategories(Iterable<Category> categories) {
    return mealDatabase.saveCategories(categories);
  }

  @override
  Future<void> saveMeals(Iterable<Meal> meals) {
    return mealDatabase.saveMeals(meals);
  }

}