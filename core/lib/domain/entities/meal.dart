import 'package:core/domain/entities/area.dart';
import 'package:core/domain/entities/meal-ingredient.dart';
import 'package:equatable/equatable.dart';

import 'category.dart';

class Meal extends Equatable {
  final String id;
  final String name;
  final String? drinkAlternate;
  final Category category;
  final Area area;
  final String? instructions;
  final String thumbnail;
  final String? tags;
  final String? youtube;
  final Iterable<MealIngredient> ingredients;
  final String? source;

  const Meal({
    required this.id,
    required this.name,
    required this.drinkAlternate,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
    required this.tags,
    required this.youtube,
    required this.ingredients,
    required this.source,
  });

  @override
  List<Object?> get props => [
    id, source,
  ];
}