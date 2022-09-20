import 'package:core/domain/entities/area.dart';
import 'package:core/domain/entities/meal-ingredient.dart';
import 'package:equatable/equatable.dart';

import 'category.dart';
import 'meal.dart';

class MealDetail extends Meal {
  final String? drinkAlternate;
  final Area area;
  final String? instructions;
  final String? tags;
  final String? youtube;
  final Iterable<MealIngredient> ingredients;
  final String? source;

  const MealDetail({
    required super.id,
    required super.name,
    required this.drinkAlternate,
    required super.category,
    required this.area,
    required super.thumbnail,
    required this.instructions,
    required this.tags,
    required this.youtube,
    required this.ingredients,
    required this.source,
    required super.favorite,
  });

  @override
  List<Object?> get props => [
    id, source,
  ];
}