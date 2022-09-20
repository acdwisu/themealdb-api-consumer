// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MealTableData extends DataClass implements Insertable<MealTableData> {
  final int id;
  final String idMeal;
  final String name;
  final String? drinkAlternate;
  final String categoryName;
  final String? areaName;
  final String? instructions;
  final String thumbnail;
  final String? tags;
  final String? youtube;
  final String? source;
  final String? ingredients;
  MealTableData(
      {required this.id,
      required this.idMeal,
      required this.name,
      this.drinkAlternate,
      required this.categoryName,
      this.areaName,
      this.instructions,
      required this.thumbnail,
      this.tags,
      this.youtube,
      this.source,
      this.ingredients});
  factory MealTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MealTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_meal'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      drinkAlternate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}drink_alternate']),
      categoryName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_name'])!,
      areaName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}area_name']),
      instructions: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}instructions']),
      thumbnail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail'])!,
      tags: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tags']),
      youtube: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}youtube']),
      source: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}source']),
      ingredients: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ingredients']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_meal'] = Variable<String>(idMeal);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || drinkAlternate != null) {
      map['drink_alternate'] = Variable<String?>(drinkAlternate);
    }
    map['category_name'] = Variable<String>(categoryName);
    if (!nullToAbsent || areaName != null) {
      map['area_name'] = Variable<String?>(areaName);
    }
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String?>(instructions);
    }
    map['thumbnail'] = Variable<String>(thumbnail);
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String?>(tags);
    }
    if (!nullToAbsent || youtube != null) {
      map['youtube'] = Variable<String?>(youtube);
    }
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String?>(source);
    }
    if (!nullToAbsent || ingredients != null) {
      map['ingredients'] = Variable<String?>(ingredients);
    }
    return map;
  }

  MealTableCompanion toCompanion(bool nullToAbsent) {
    return MealTableCompanion(
      id: Value(id),
      idMeal: Value(idMeal),
      name: Value(name),
      drinkAlternate: drinkAlternate == null && nullToAbsent
          ? const Value.absent()
          : Value(drinkAlternate),
      categoryName: Value(categoryName),
      areaName: areaName == null && nullToAbsent
          ? const Value.absent()
          : Value(areaName),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      thumbnail: Value(thumbnail),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      youtube: youtube == null && nullToAbsent
          ? const Value.absent()
          : Value(youtube),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      ingredients: ingredients == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredients),
    );
  }

  factory MealTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MealTableData(
      id: serializer.fromJson<int>(json['id']),
      idMeal: serializer.fromJson<String>(json['idMeal']),
      name: serializer.fromJson<String>(json['name']),
      drinkAlternate: serializer.fromJson<String?>(json['drinkAlternate']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
      areaName: serializer.fromJson<String?>(json['areaName']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
      tags: serializer.fromJson<String?>(json['tags']),
      youtube: serializer.fromJson<String?>(json['youtube']),
      source: serializer.fromJson<String?>(json['source']),
      ingredients: serializer.fromJson<String?>(json['ingredients']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idMeal': serializer.toJson<String>(idMeal),
      'name': serializer.toJson<String>(name),
      'drinkAlternate': serializer.toJson<String?>(drinkAlternate),
      'categoryName': serializer.toJson<String>(categoryName),
      'areaName': serializer.toJson<String?>(areaName),
      'instructions': serializer.toJson<String?>(instructions),
      'thumbnail': serializer.toJson<String>(thumbnail),
      'tags': serializer.toJson<String?>(tags),
      'youtube': serializer.toJson<String?>(youtube),
      'source': serializer.toJson<String?>(source),
      'ingredients': serializer.toJson<String?>(ingredients),
    };
  }

  MealTableData copyWith(
          {int? id,
          String? idMeal,
          String? name,
          String? drinkAlternate,
          String? categoryName,
          String? areaName,
          String? instructions,
          String? thumbnail,
          String? tags,
          String? youtube,
          String? source,
          String? ingredients}) =>
      MealTableData(
        id: id ?? this.id,
        idMeal: idMeal ?? this.idMeal,
        name: name ?? this.name,
        drinkAlternate: drinkAlternate ?? this.drinkAlternate,
        categoryName: categoryName ?? this.categoryName,
        areaName: areaName ?? this.areaName,
        instructions: instructions ?? this.instructions,
        thumbnail: thumbnail ?? this.thumbnail,
        tags: tags ?? this.tags,
        youtube: youtube ?? this.youtube,
        source: source ?? this.source,
        ingredients: ingredients ?? this.ingredients,
      );
  @override
  String toString() {
    return (StringBuffer('MealTableData(')
          ..write('id: $id, ')
          ..write('idMeal: $idMeal, ')
          ..write('name: $name, ')
          ..write('drinkAlternate: $drinkAlternate, ')
          ..write('categoryName: $categoryName, ')
          ..write('areaName: $areaName, ')
          ..write('instructions: $instructions, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('tags: $tags, ')
          ..write('youtube: $youtube, ')
          ..write('source: $source, ')
          ..write('ingredients: $ingredients')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      idMeal,
      name,
      drinkAlternate,
      categoryName,
      areaName,
      instructions,
      thumbnail,
      tags,
      youtube,
      source,
      ingredients);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealTableData &&
          other.id == this.id &&
          other.idMeal == this.idMeal &&
          other.name == this.name &&
          other.drinkAlternate == this.drinkAlternate &&
          other.categoryName == this.categoryName &&
          other.areaName == this.areaName &&
          other.instructions == this.instructions &&
          other.thumbnail == this.thumbnail &&
          other.tags == this.tags &&
          other.youtube == this.youtube &&
          other.source == this.source &&
          other.ingredients == this.ingredients);
}

class MealTableCompanion extends UpdateCompanion<MealTableData> {
  final Value<int> id;
  final Value<String> idMeal;
  final Value<String> name;
  final Value<String?> drinkAlternate;
  final Value<String> categoryName;
  final Value<String?> areaName;
  final Value<String?> instructions;
  final Value<String> thumbnail;
  final Value<String?> tags;
  final Value<String?> youtube;
  final Value<String?> source;
  final Value<String?> ingredients;
  const MealTableCompanion({
    this.id = const Value.absent(),
    this.idMeal = const Value.absent(),
    this.name = const Value.absent(),
    this.drinkAlternate = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.areaName = const Value.absent(),
    this.instructions = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.tags = const Value.absent(),
    this.youtube = const Value.absent(),
    this.source = const Value.absent(),
    this.ingredients = const Value.absent(),
  });
  MealTableCompanion.insert({
    this.id = const Value.absent(),
    required String idMeal,
    required String name,
    this.drinkAlternate = const Value.absent(),
    required String categoryName,
    this.areaName = const Value.absent(),
    this.instructions = const Value.absent(),
    required String thumbnail,
    this.tags = const Value.absent(),
    this.youtube = const Value.absent(),
    this.source = const Value.absent(),
    this.ingredients = const Value.absent(),
  })  : idMeal = Value(idMeal),
        name = Value(name),
        categoryName = Value(categoryName),
        thumbnail = Value(thumbnail);
  static Insertable<MealTableData> custom({
    Expression<int>? id,
    Expression<String>? idMeal,
    Expression<String>? name,
    Expression<String?>? drinkAlternate,
    Expression<String>? categoryName,
    Expression<String?>? areaName,
    Expression<String?>? instructions,
    Expression<String>? thumbnail,
    Expression<String?>? tags,
    Expression<String?>? youtube,
    Expression<String?>? source,
    Expression<String?>? ingredients,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idMeal != null) 'id_meal': idMeal,
      if (name != null) 'name': name,
      if (drinkAlternate != null) 'drink_alternate': drinkAlternate,
      if (categoryName != null) 'category_name': categoryName,
      if (areaName != null) 'area_name': areaName,
      if (instructions != null) 'instructions': instructions,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (tags != null) 'tags': tags,
      if (youtube != null) 'youtube': youtube,
      if (source != null) 'source': source,
      if (ingredients != null) 'ingredients': ingredients,
    });
  }

  MealTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? idMeal,
      Value<String>? name,
      Value<String?>? drinkAlternate,
      Value<String>? categoryName,
      Value<String?>? areaName,
      Value<String?>? instructions,
      Value<String>? thumbnail,
      Value<String?>? tags,
      Value<String?>? youtube,
      Value<String?>? source,
      Value<String?>? ingredients}) {
    return MealTableCompanion(
      id: id ?? this.id,
      idMeal: idMeal ?? this.idMeal,
      name: name ?? this.name,
      drinkAlternate: drinkAlternate ?? this.drinkAlternate,
      categoryName: categoryName ?? this.categoryName,
      areaName: areaName ?? this.areaName,
      instructions: instructions ?? this.instructions,
      thumbnail: thumbnail ?? this.thumbnail,
      tags: tags ?? this.tags,
      youtube: youtube ?? this.youtube,
      source: source ?? this.source,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (drinkAlternate.present) {
      map['drink_alternate'] = Variable<String?>(drinkAlternate.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (areaName.present) {
      map['area_name'] = Variable<String?>(areaName.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String?>(instructions.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String?>(tags.value);
    }
    if (youtube.present) {
      map['youtube'] = Variable<String?>(youtube.value);
    }
    if (source.present) {
      map['source'] = Variable<String?>(source.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String?>(ingredients.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealTableCompanion(')
          ..write('id: $id, ')
          ..write('idMeal: $idMeal, ')
          ..write('name: $name, ')
          ..write('drinkAlternate: $drinkAlternate, ')
          ..write('categoryName: $categoryName, ')
          ..write('areaName: $areaName, ')
          ..write('instructions: $instructions, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('tags: $tags, ')
          ..write('youtube: $youtube, ')
          ..write('source: $source, ')
          ..write('ingredients: $ingredients')
          ..write(')'))
        .toString();
  }
}

class $MealTableTable extends MealTable
    with TableInfo<$MealTableTable, MealTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<String?> idMeal = GeneratedColumn<String?>(
      'id_meal', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _drinkAlternateMeta =
      const VerificationMeta('drinkAlternate');
  @override
  late final GeneratedColumn<String?> drinkAlternate = GeneratedColumn<String?>(
      'drink_alternate', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String?> categoryName = GeneratedColumn<String?>(
      'category_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _areaNameMeta = const VerificationMeta('areaName');
  @override
  late final GeneratedColumn<String?> areaName = GeneratedColumn<String?>(
      'area_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _instructionsMeta =
      const VerificationMeta('instructions');
  @override
  late final GeneratedColumn<String?> instructions = GeneratedColumn<String?>(
      'instructions', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _thumbnailMeta = const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String?> thumbnail = GeneratedColumn<String?>(
      'thumbnail', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String?> tags = GeneratedColumn<String?>(
      'tags', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _youtubeMeta = const VerificationMeta('youtube');
  @override
  late final GeneratedColumn<String?> youtube = GeneratedColumn<String?>(
      'youtube', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String?> source = GeneratedColumn<String?>(
      'source', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _ingredientsMeta =
      const VerificationMeta('ingredients');
  @override
  late final GeneratedColumn<String?> ingredients = GeneratedColumn<String?>(
      'ingredients', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idMeal,
        name,
        drinkAlternate,
        categoryName,
        areaName,
        instructions,
        thumbnail,
        tags,
        youtube,
        source,
        ingredients
      ];
  @override
  String get aliasedName => _alias ?? 'meal_table';
  @override
  String get actualTableName => 'meal_table';
  @override
  VerificationContext validateIntegrity(Insertable<MealTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('drink_alternate')) {
      context.handle(
          _drinkAlternateMeta,
          drinkAlternate.isAcceptableOrUnknown(
              data['drink_alternate']!, _drinkAlternateMeta));
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    if (data.containsKey('area_name')) {
      context.handle(_areaNameMeta,
          areaName.isAcceptableOrUnknown(data['area_name']!, _areaNameMeta));
    }
    if (data.containsKey('instructions')) {
      context.handle(
          _instructionsMeta,
          instructions.isAcceptableOrUnknown(
              data['instructions']!, _instructionsMeta));
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('youtube')) {
      context.handle(_youtubeMeta,
          youtube.isAcceptableOrUnknown(data['youtube']!, _youtubeMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    if (data.containsKey('ingredients')) {
      context.handle(
          _ingredientsMeta,
          ingredients.isAcceptableOrUnknown(
              data['ingredients']!, _ingredientsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MealTableData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MealTableTable createAlias(String alias) {
    return $MealTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int id;
  final String idCategory;
  final String name;
  final String thumbnail;
  final String description;
  CategoryTableData(
      {required this.id,
      required this.idCategory,
      required this.name,
      required this.thumbnail,
      required this.description});
  factory CategoryTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CategoryTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idCategory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_category'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      thumbnail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_category'] = Variable<String>(idCategory);
    map['name'] = Variable<String>(name);
    map['thumbnail'] = Variable<String>(thumbnail);
    map['description'] = Variable<String>(description);
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      idCategory: Value(idCategory),
      name: Value(name),
      thumbnail: Value(thumbnail),
      description: Value(description),
    );
  }

  factory CategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      id: serializer.fromJson<int>(json['id']),
      idCategory: serializer.fromJson<String>(json['idCategory']),
      name: serializer.fromJson<String>(json['name']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idCategory': serializer.toJson<String>(idCategory),
      'name': serializer.toJson<String>(name),
      'thumbnail': serializer.toJson<String>(thumbnail),
      'description': serializer.toJson<String>(description),
    };
  }

  CategoryTableData copyWith(
          {int? id,
          String? idCategory,
          String? name,
          String? thumbnail,
          String? description}) =>
      CategoryTableData(
        id: id ?? this.id,
        idCategory: idCategory ?? this.idCategory,
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('id: $id, ')
          ..write('idCategory: $idCategory, ')
          ..write('name: $name, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idCategory, name, thumbnail, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.id == this.id &&
          other.idCategory == this.idCategory &&
          other.name == this.name &&
          other.thumbnail == this.thumbnail &&
          other.description == this.description);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> id;
  final Value<String> idCategory;
  final Value<String> name;
  final Value<String> thumbnail;
  final Value<String> description;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.idCategory = const Value.absent(),
    this.name = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.description = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String idCategory,
    required String name,
    required String thumbnail,
    required String description,
  })  : idCategory = Value(idCategory),
        name = Value(name),
        thumbnail = Value(thumbnail),
        description = Value(description);
  static Insertable<CategoryTableData> custom({
    Expression<int>? id,
    Expression<String>? idCategory,
    Expression<String>? name,
    Expression<String>? thumbnail,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCategory != null) 'id_category': idCategory,
      if (name != null) 'name': name,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (description != null) 'description': description,
    });
  }

  CategoryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? idCategory,
      Value<String>? name,
      Value<String>? thumbnail,
      Value<String>? description}) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      idCategory: idCategory ?? this.idCategory,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idCategory.present) {
      map['id_category'] = Variable<String>(idCategory.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('idCategory: $idCategory, ')
          ..write('name: $name, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idCategoryMeta = const VerificationMeta('idCategory');
  @override
  late final GeneratedColumn<String?> idCategory = GeneratedColumn<String?>(
      'id_category', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _thumbnailMeta = const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String?> thumbnail = GeneratedColumn<String?>(
      'thumbnail', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idCategory, name, thumbnail, description];
  @override
  String get aliasedName => _alias ?? 'category_table';
  @override
  String get actualTableName => 'category_table';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_category')) {
      context.handle(
          _idCategoryMeta,
          idCategory.isAcceptableOrUnknown(
              data['id_category']!, _idCategoryMeta));
    } else if (isInserting) {
      context.missing(_idCategoryMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CategoryTableData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class FavoriteTableData extends DataClass
    implements Insertable<FavoriteTableData> {
  final int id;
  final String idMeal;
  FavoriteTableData({required this.id, required this.idMeal});
  factory FavoriteTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FavoriteTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_meal'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_meal'] = Variable<String>(idMeal);
    return map;
  }

  FavoriteTableCompanion toCompanion(bool nullToAbsent) {
    return FavoriteTableCompanion(
      id: Value(id),
      idMeal: Value(idMeal),
    );
  }

  factory FavoriteTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavoriteTableData(
      id: serializer.fromJson<int>(json['id']),
      idMeal: serializer.fromJson<String>(json['idMeal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idMeal': serializer.toJson<String>(idMeal),
    };
  }

  FavoriteTableData copyWith({int? id, String? idMeal}) => FavoriteTableData(
        id: id ?? this.id,
        idMeal: idMeal ?? this.idMeal,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteTableData(')
          ..write('id: $id, ')
          ..write('idMeal: $idMeal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idMeal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteTableData &&
          other.id == this.id &&
          other.idMeal == this.idMeal);
}

class FavoriteTableCompanion extends UpdateCompanion<FavoriteTableData> {
  final Value<int> id;
  final Value<String> idMeal;
  const FavoriteTableCompanion({
    this.id = const Value.absent(),
    this.idMeal = const Value.absent(),
  });
  FavoriteTableCompanion.insert({
    this.id = const Value.absent(),
    required String idMeal,
  }) : idMeal = Value(idMeal);
  static Insertable<FavoriteTableData> custom({
    Expression<int>? id,
    Expression<String>? idMeal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idMeal != null) 'id_meal': idMeal,
    });
  }

  FavoriteTableCompanion copyWith({Value<int>? id, Value<String>? idMeal}) {
    return FavoriteTableCompanion(
      id: id ?? this.id,
      idMeal: idMeal ?? this.idMeal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteTableCompanion(')
          ..write('id: $id, ')
          ..write('idMeal: $idMeal')
          ..write(')'))
        .toString();
  }
}

class $FavoriteTableTable extends FavoriteTable
    with TableInfo<$FavoriteTableTable, FavoriteTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<String?> idMeal = GeneratedColumn<String?>(
      'id_meal', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE REFERENCES meal_table (id_meal)');
  @override
  List<GeneratedColumn> get $columns => [id, idMeal];
  @override
  String get aliasedName => _alias ?? 'favorite_table';
  @override
  String get actualTableName => 'favorite_table';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FavoriteTableData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavoriteTableTable createAlias(String alias) {
    return $FavoriteTableTable(attachedDatabase, alias);
  }
}

abstract class _$MealDatabase extends GeneratedDatabase {
  _$MealDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MealTableTable mealTable = $MealTableTable(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $FavoriteTableTable favoriteTable = $FavoriteTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [mealTable, categoryTable, favoriteTable];
}
