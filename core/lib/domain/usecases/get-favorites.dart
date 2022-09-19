import 'package:core/common/failure.dart';
import 'package:core/domain/entities/meal.dart';
import 'package:dartz/dartz.dart';

import '../repositories/meal-repository.dart';

class GetFavorites {
  final MealRepository mealRepository;

  GetFavorites(this.mealRepository);

  Future<Either<Failure, Iterable<Meal>>> execute() {
    return mealRepository.getFavorites();
  }
}