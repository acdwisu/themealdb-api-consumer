import 'package:core/common/failure.dart';
import 'package:core/domain/entities/meal.dart';
import 'package:core/domain/repositories/meal-repository.dart';
import 'package:dartz/dartz.dart';

class SearchMeal {
  final MealRepository mealRepository;

  SearchMeal(this.mealRepository);

  Future<Either<Failure, Iterable<Meal>>> execute(String query) {
    return mealRepository.searchMealByQuery(query);
  }
}