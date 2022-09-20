import 'package:moor_flutter/moor_flutter.dart';

class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idCategory => text().unique()();
  TextColumn get name => text().unique()();
  TextColumn get thumbnail => text()();
  TextColumn get description => text()();
}