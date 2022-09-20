import 'dart:convert';

import 'package:core/data/datasources/meal/moor-helper/category-table.dart';
import 'package:core/data/datasources/meal/moor-helper/favorite-table.dart';
import 'package:core/data/datasources/meal/moor-helper/meal-table.dart';
import 'package:core/data/models/area.dart';
import 'package:core/data/models/category-detail.dart';
import 'package:core/data/models/category.dart';
import 'package:core/data/models/meal-detail.dart';
import 'package:core/data/models/meal-ingredient.dart';
import 'package:core/data/models/meal.dart';
import 'package:core/domain/entities/category-detail.dart';
import 'package:core/domain/entities/meal-detail.dart';
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
  int get schemaVersion => 2;

  Future<List<MealDetailModel>> getCachedMealsByCategory(String categoryName) =>
    (select(mealTable)..where((tbl) => tbl.categoryName.equals(categoryName)))
      .join([
        leftOuterJoin(favoriteTable, mealTable.idMeal.equalsExp(favoriteTable.idMeal))
      ]).map((eRaw) {
        final e = eRaw.readTable(mealTable);
        final f = eRaw.readTableOrNull(favoriteTable);

        return MealDetailModel(
          id: e.idMeal,
          name: e.name,
          drinkAlternate: e.drinkAlternate,
          category: CategoryModel(name: e.categoryName),
          area: AreaModel(name: e.areaName ?? ''),
          instructions: e.instructions,
          thumbnail: e.thumbnail,
          tags: e.tags,
          youtube: e.youtube,
          ingredients: e.ingredients==null? const Iterable.empty() :
            ((jsonDecode(e.ingredients!)) as List).map((e) => MealIngredientModel(
              stuff: e['a'],
              measurement: e['b'],
            )),
          source: e.source,
          favorite: f!=null,
        );
    }).get();

  Future<void> saveMeal(MealDetail meal) =>
    into(mealTable).insert(MealTableCompanion.insert(
        idMeal: meal.id,
        name: meal.name,
        categoryName: meal.category.name,
        areaName: Value(meal.area.name),
        instructions: Value(meal.instructions),
        tags: Value(meal.tags),
        thumbnail: meal.thumbnail,
        source: Value(meal.source),
        youtube: Value(meal.youtube),
        drinkAlternate: Value(meal.drinkAlternate),
        ingredients: Value(jsonEncode(meal.ingredients.map((f) => {
          'a': f.stuff,
          'b': f.measurement,
        }).toList()))
    ), mode: InsertMode.insertOrReplace);
  
  Future<void> saveMeals(Iterable<Meal> meals) =>
    batch((batch) {
      batch.insertAll(mealTable, meals.map((e) => MealTableCompanion.insert(
        idMeal: e.id,
        name: e.name,
        categoryName: e.category.name,
        thumbnail: e.thumbnail,
      )), mode: InsertMode.insertOrReplace);
    });

  Future<List<CategoryDetailModel>> getCategories() =>
    select(categoryTable).map((e) => CategoryDetailModel(
      name: e.name,
      thumbnail: e.thumbnail,
      id: e.idCategory,
      description: e.description,
    )).get();

  Future<void> saveCategories(Iterable<CategoryDetail> categories) =>
    batch((batch) {
      batch.insertAll(categoryTable, categories.map((e) => CategoryTableCompanion.insert(
        name: e.name,
        description: e.description,
        thumbnail: e.thumbnail,
        idCategory: e.id,
      )), mode: InsertMode.insertOrReplace);
    });

  Future<List<int>> getFavoritedMealsId() =>
    select(favoriteTable).map((e) => e.id).get();
  
  Future<List<MealModel>> getFavoriteMeals() =>
      select(favoriteTable).join([
        innerJoin(mealTable, mealTable.idMeal.equalsExp(favoriteTable.idMeal))
      ]).map((rawE) {
        final e = rawE.readTable(mealTable);

        return MealModel(
          id: e.idMeal,
          name: e.name,
          category: CategoryModel(name: e.categoryName),
          thumbnail: e.thumbnail,
          favorite: true,
        );
      }).get();

  Future<int> newFavorite(String idMeal) => into(favoriteTable).insert(FavoriteTableCompanion.insert(
    idMeal: idMeal,
  ));

  Future<int> deleteFavorite(String idMeal) => (delete(favoriteTable)
    ..where((tbl) => tbl.idMeal.equals(idMeal))).go();

  Future<MealDetailModel?> getDetailMeal(String idMeal) => (select(mealTable)
    ..where((tbl) => tbl.idMeal.equals(idMeal))).join([
      leftOuterJoin(favoriteTable, mealTable.idMeal.equalsExp(favoriteTable.idMeal))
  ]).map((eRaw) {
    final e = eRaw.readTable(mealTable);
    final f = eRaw.readTableOrNull(favoriteTable);

    return MealDetailModel(
       id: e.idMeal,
       name: e.name,
       drinkAlternate: e.drinkAlternate,
       category: CategoryModel(name: e.categoryName),
       area: AreaModel(name: e.areaName ?? ''),
       instructions: e.instructions,
       thumbnail: e.thumbnail,
       tags: e.tags,
       youtube: e.youtube,
       ingredients: e.ingredients==null? const Iterable.empty() :
         ((jsonDecode(e.ingredients!)) as List).map((e) => MealIngredientModel(
           stuff: e['a'],
           measurement: e['b'],
         )),
       source: e.source,
       favorite: f!=null);
  }).getSingleOrNull();
}