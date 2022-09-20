import 'package:core/common/failure.dart';
import 'package:core/domain/entities/category-detail.dart';
import 'package:core/domain/repositories/meal-repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/meal.dart';

class GetMealsByCategory {
  final MealRepository mealRepository;

  GetMealsByCategory({required this.mealRepository});

  Stream<Either<Failure, Iterable<Meal>>> execute(CategoryDetail category) {
    return mealRepository.getMealPerCategory(category);
  }
}