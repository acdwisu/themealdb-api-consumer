import 'package:core/data/models/model.dart';
import 'package:core/domain/entities/meal-ingredient.dart';

class MealIngredientModel extends Model<MealIngredient> {
  final String stuff;
  final String measurement;

  MealIngredientModel({required this.stuff, required this.measurement});

  @override
  MealIngredient get toEntity => MealIngredient(
    stuff: stuff,
    measurement: measurement,
  );
}