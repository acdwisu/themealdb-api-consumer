import 'package:core/data/models/category.dart';
import 'package:core/domain/entities/meal.dart';

import 'model.dart';

class MealModel implements Model<Meal> {
  final String id;
  final String name;
  final String thumbnail;
  final CategoryModel category;
  bool favorite;

  MealModel({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.favorite,
    required this.category,
  });

  factory MealModel.fromJsonRemote(Map m, String category) {
    return MealModel(
      id: m['idMeal'],
      name: m['strMeal'],
      thumbnail: m['strMealThumb'],
      category: CategoryModel(
        name: category
      ),
      favorite: false,
    );
  }

  @override
  Meal get toEntity => Meal(
    id: id,
    name: name,
    thumbnail: thumbnail,
    category: category.toEntity,
    favorite: favorite
  );
}