import 'package:core/data/datasources/meal/moor-helper/meal-table.dart';
import 'package:moor_flutter/moor_flutter.dart';

class FavoriteTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idMeal => text().unique().references(MealTable, #idMeal)();
}