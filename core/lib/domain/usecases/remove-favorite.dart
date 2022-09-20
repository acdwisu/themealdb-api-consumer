import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../repositories/meal-repository.dart';

class RemoveFavorites {
  final MealRepository mealRepository;

  RemoveFavorites(this.mealRepository);

  Future<Either<Failure, String>> execute(String idMeal) {
    return mealRepository.removeFromFavorite(idMeal);
  }
}