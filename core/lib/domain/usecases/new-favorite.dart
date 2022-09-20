import 'package:core/common/failure.dart';
import 'package:core/domain/entities/meal.dart';
import 'package:dartz/dartz.dart';

import '../repositories/meal-repository.dart';

class NewFavorites {
  final MealRepository mealRepository;

  NewFavorites(this.mealRepository);

  Future<Either<Failure, String>> execute(String idMeal) {
    return mealRepository.newFavorite(idMeal);
  }
}