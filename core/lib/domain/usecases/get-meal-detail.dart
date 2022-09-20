import 'package:core/common/failure.dart';
import 'package:core/domain/entities/meal-detail.dart';
import 'package:core/domain/repositories/meal-repository.dart';
import 'package:dartz/dartz.dart';

class GetMealDetail {
  final MealRepository mealRepository;

  GetMealDetail(this.mealRepository);

  Stream<Either<Failure, MealDetail>> execute(String idMeal) {
    return mealRepository.detailMeal(idMeal);
  }
}