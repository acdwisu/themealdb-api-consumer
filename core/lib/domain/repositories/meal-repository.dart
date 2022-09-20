import 'package:core/common/failure.dart';
import 'package:core/domain/entities/category-detail.dart';
import 'package:core/domain/entities/meal-detail.dart';
import 'package:core/domain/entities/meal.dart';
import 'package:dartz/dartz.dart';

abstract class MealRepository {
  Stream<Either<Failure, Iterable<CategoryDetail>>> getCategories();
  Future<Either<Failure, Iterable<Meal>>> getFavorites();
  Future<Either<Failure, String>> newFavorite(String idMeal);
  Future<Either<Failure, String>> removeFromFavorite(String idMeal);
  Stream<Either<Failure, Iterable<Meal>>> getMealPerCategory(CategoryDetail category);
  Future<Either<Failure, Iterable<Meal>>> searchMealByQuery(String query);
  Stream<Either<Failure, MealDetail>> detailMeal(String idMeal);
}