import 'dart:convert';

import 'package:core/data/datasources/meal/moor-helper/category-table.dart';
import 'package:core/data/datasources/meal/moor-helper/favorite-table.dart';
import 'package:core/data/datasources/meal/moor-helper/meal-table.dart';
import 'package:core/data/models/area.dart';
import 'package:core/data/models/category.dart';
import 'package:core/data/models/meal-ingredient.dart';
import 'package:core/data/models/meal.dart';
import 'package:core/domain/entities/category.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../../../../domain/entities/meal.dart';

part 'database.g.dart';

@UseMoor(tables: [
  MealTable,
  CategoryTable,
  FavoriteTable,
])
class MealDatabase extends _$MealDatabase {
  MealDatabase() : super(
    FlutterQueryExecutor.inDatabaseFolder(
      path: "meal.db",
      logStatements: true,
      singleInstance: true,
    )
  );

  @override
  int get schemaVersion => 1;

  Future<List<MealModel>> getCachedMealsByCategory(String categoryName) =>
    (select(mealTable)..where((tbl) => tbl.categoryName.equals(categoryName))).map((e) => MealModel(
        id: e.idMeal,
        name: e.name,
        drinkAlternate: e.drinkAlternate,
        category: CategoryModel(name: e.categoryName),
        area: AreaModel(name: e.areaName),
        instructions: e.instructions,
        thumbnail: e.thumbnail,
        tags: e.tags,
        youtube: e.youtube,
        ingredients: e.ingredients==null? const Iterable.empty() :
          ((jsonDecode(e.ingredients!)) as List).map((e) => MealIngredientModel(
            stuff: e['a'],
            measurement: e['b'],
          )),
        source: e.source
    )).get();

  Future<void> saveMeals(Iterable<Meal> meals) =>
    batch((batch) {
      batch.insertAll(mealTable, meals.map((e) => MealTableCompanion.insert(
        idMeal: e.id,
        name: e.name,
        categoryName: e.category.name,
        areaName: e.area.name,
        instructions: Value(e.instructions),
        tags: Value(e.tags),
        thumbnail: e.thumbnail,
        source: Value(e.source),
        youtube: Value(e.youtube),
        drinkAlternate: Value(e.drinkAlternate),
        ingredients: Value(jsonEncode(e.ingredients.map((f) => {
          'a': f.stuff,
          'b': f.measurement,
        }).toList()))
      )));
    });

  Future<List<CategoryModel>> getCategories() =>
    select(categoryTable).map((e) => CategoryModel(name: e.name)).get();

  Future<void> saveCategories(Iterable<Category> categories) =>
    batch((batch) {
      batch.insertAll(categoryTable, categories.map((e) => CategoryTableCompanion.insert(
        name: e.name
      )));
    });

  Future<List<MealModel>> getFavoriteMeals() =>
      select(favoriteTable).join([
        innerJoin(mealTable, mealTable.idMeal.equalsExp(favoriteTable.idMeal))
      ]).map((rawE) {
        final e = rawE.readTable(mealTable);

        return MealModel(
          id: e.idMeal,
          name: e.name,
          drinkAlternate: e.drinkAlternate,
          category: CategoryModel(name: e.categoryName),
          area: AreaModel(name: e.areaName),
          instructions: e.instructions,
          thumbnail: e.thumbnail,
          tags: e.tags,
          youtube: e.youtube,
          ingredients: e.ingredients==null? const Iterable.empty() :
          ((jsonDecode(e.ingredients!)) as List).map((e) => MealIngredientModel(
            stuff: e['a'],
            measurement: e['b'],
          )),
          source: e.source
        );
      }).get();

  Future<int> newFavorite(String idMeal) => into(favoriteTable).insert(FavoriteTableCompanion.insert(
    idMeal: idMeal,
  ));

  Future<int> deleteFavorite(String idMeal) => (delete(favoriteTable)
    ..where((tbl) => tbl.idMeal.equals(idMeal))).go();
}