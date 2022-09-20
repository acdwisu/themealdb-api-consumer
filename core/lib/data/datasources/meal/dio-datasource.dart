import 'dart:convert';
import 'dart:developer';

import 'package:core/data/datasources/meal/remote-datasource.dart';
import 'package:core/data/models/category-detail.dart';
import 'package:core/data/models/meal-detail.dart';
import 'package:core/data/models/meal.dart';
import 'package:core/domain/entities/category-detail.dart';
import 'package:dio/dio.dart';

class MealDioDatasource extends MealRemoteDatasource {
  final Dio dio;

  MealDioDatasource(this.dio);

  @override
  Future<Iterable<CategoryDetailModel>> getCategories() async {
    try {
      final response = await dio.get('/categories.php');
      
      if(response.statusCode != 200) {
        return List.empty();
      }
      
      return (response.data['categories'] as List)
          .map((e) => CategoryDetailModel.fromJsonRemote(e));
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);
      
      return List.empty();
    }
  }

  @override
  Future<Iterable<MealModel>> getMealsByCategory(CategoryDetail category) async {
    try {
      final response = await dio.get('/filter.php?c=${category.name}');

      if(response.statusCode != 200) {
        return List.empty();
      }

      return (response.data['meals'] as List)
          .map((e) => MealModel.fromJsonRemote(e, category.name));
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);

      return List.empty();
    }
  }

  @override
  Future<Iterable<MealDetailModel>> searchMealsByQuery(String query) async {
    try {
      final response = await dio.get('/search.php?s=$query');

      if(response.statusCode != 200) {
        return List.empty();
      }

      return (response.data['meals'] as List)
          .map((e) => MealDetailModel.fromJsonRemote(e));
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);

      return List.empty();
    }
  }

  @override
  Future<MealDetailModel?> getDetailMeal(String idMeal) async {
    try {
      final response = await dio.get('/lookup.php?i=$idMeal');

      if(response.statusCode != 200) {
        return throw Exception('response invalid');
      }

      return MealDetailModel.fromJsonRemote(response.data['meals'][0]);
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);

      return null;
    }
  }

}