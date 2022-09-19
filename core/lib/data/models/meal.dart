import 'package:core/data/models/area.dart';
import 'package:core/data/models/meal-ingredient.dart';
import 'package:core/domain/entities/meal.dart';

import 'category.dart';
import 'model.dart';

class MealModel extends Model<Meal> {
  final String id;
  final String name;
  final String? drinkAlternate;
  final CategoryModel category;
  final AreaModel area;
  final String? instructions;
  final String thumbnail;
  final String? tags;
  final String? youtube;
  final Iterable<MealIngredientModel> ingredients;
  final String? source;

  MealModel({
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

  factory MealModel.fromJsonRemote(Map m) {
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

    return MealModel(
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
    );
  }

  @override
  Meal get toEntity => Meal(
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
      source: source
  );
}