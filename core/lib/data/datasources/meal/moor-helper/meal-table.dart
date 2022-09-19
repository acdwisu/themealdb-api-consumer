import 'package:moor_flutter/moor_flutter.dart';

class MealTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idMeal => text().unique()();
  TextColumn get name => text()();
  TextColumn get drinkAlternate => text().nullable()();
  TextColumn get categoryName => text()();
  TextColumn get areaName => text()();
  TextColumn get instructions => text().nullable()();
  TextColumn get thumbnail => text()();
  TextColumn get tags => text().nullable()();
  TextColumn get youtube => text().nullable()();
  TextColumn get source => text().nullable()();
  TextColumn get ingredients => text().nullable()();
}