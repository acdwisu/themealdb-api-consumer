import 'package:core/common/failure.dart';
import 'package:core/domain/entities/category.dart';
import 'package:core/domain/entities/meal.dart';
import 'package:dartz/dartz.dart';

abstract class MealRepository {
  Stream<Either<Failure, Iterable<Category>>> getCategories();
  Future<Either<Failure, Iterable<Meal>>> getFavorites();
  Future<Either<Failure, String>> newFavorite(Meal meal);
  Future<Either<Failure, String>> removeFromFavorite(String idMeal);
  Stream<Either<Failure, Iterable<Meal>>> getMealPerCategory(Category category);
  Future<Either<Failure, Iterable<Meal>>> searchMealByQuery(String query);
}