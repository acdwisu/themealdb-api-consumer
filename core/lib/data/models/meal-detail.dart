import 'package:core/data/models/area.dart';
import 'package:core/data/models/meal-ingredient.dart';
import 'package:core/data/models/meal.dart';
import 'package:core/domain/entities/meal-detail.dart';

import 'category.dart';

class MealDetailModel extends MealModel {
  final String? drinkAlternate;
  final AreaModel area;
  final String? instructions;
  final String? tags;
  final String? youtube;
  final Iterable<MealIngredientModel> ingredients;
  final String? source;

  MealDetailModel({
    required super.id,
    required super.name,
    required this.drinkAlternate,
    required super.category,
    required this.area,
    required this.instructions,
    required super.thumbnail,
    required this.tags,
    required this.youtube,
    required this.ingredients,
    required this.source,
    required super.favorite,
  });

  factory MealDetailModel.fromJsonRemote(Map m) {
    final ingredients = <MealIngredientModel>[];

    const keyStuff = 'strIngredient', keyMeasure = 'strMeasure';

    for(int i=1; i<=20; i++) {
      final key = keyStuff + i.toString();

      if(m[key] != null && (m[key] as String).isNotEmpty) {
        ingredients.add(MealIngredientModel(
          stuff: m[key],
          measurement: m[keyMeasure + i.toString()]
        ));
      }
    }

    return MealDetailModel(
      id: m['idMeal'],
      name: m['strMeal'],
      drinkAlternate: m['strDrinkAlternate'],
      category: CategoryModel.fromJsonRemote(m),
      area: AreaModel.fromJsonRemote(m),
      instructions: m['strInstructions'],
      thumbnail: m['strMealThumb'],
      tags: m['strTags'],
      youtube: m['strYoutube'],
      source: m['strSource'],
      ingredients: ingredients,
      favorite: false,
    );
  }

  @override
  MealDetail get toEntity => MealDetail(
    id: id,
    name: name,
    drinkAlternate: drinkAlternate,
    category: category.toEntity,
    area: area.toEntity,
    instructions: instructions,
    thumbnail: thumbnail,
    tags: tags,
    youtube: youtube,
    ingredients: ingredients.map((e) => e.toEntity),
    source: source,
    favorite: favorite
  );
}