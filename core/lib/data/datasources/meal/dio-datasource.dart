import 'dart:convert';
import 'dart:developer';

import 'package:core/common/instance.dart';
import 'package:core/data/datasources/meal/remote-datasource.dart';
import 'package:core/data/models/category.dart';
import 'package:core/data/models/meal.dart';
import 'package:core/domain/entities/category.dart';

class MealDioDatasource extends MealRemoteDatasource {
  @override
  Future<Iterable<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get('/list.php?c=list');
      
      if(response.statusCode != 200) {
        return List.empty();
      }
      
      return (jsonDecode(response.data)['meals'] as List)
          .map((e) => CategoryModel.fromJsonRemote(e));
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);
      
      return List.empty();
    }
  }

  @override
  Future<Iterable<MealModel>> getMealsByCategory(Category category) async {
    try {
      final response = await dio.get('/filter.php?c=${category.name}');

      if(response.statusCode != 200) {
        return List.empty();
      }

      return (jsonDecode(response.data)['meals'] as List)
          .map((e) => MealModel.fromJsonRemote(e));
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);

      return List.empty();
    }
  }

  @override
  Future<Iterable<MealModel>> searchMealsByQuery(String query) async {
    try {
      final response = await dio.get('/search.php?s=$query');

      if(response.statusCode != 200) {
        return List.empty();
      }

      return (jsonDecode(response.data)['meals'] as List)
          .map((e) => MealModel.fromJsonRemote(e));
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);

      return List.empty();
    }
  }

}