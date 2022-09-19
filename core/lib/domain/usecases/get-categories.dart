import 'package:core/domain/entities/category.dart';
import 'package:core/domain/repositories/meal-repository.dart';
import 'package:dartz/dartz.dart';

import '../../common/failure.dart';

class GetCategories {
  final MealRepository mealRepository;

  GetCategories(this.mealRepository);

  Stream<Either<Failure, Iterable<Category>>> execute() {
    return mealRepository.getCategories();
  }
}