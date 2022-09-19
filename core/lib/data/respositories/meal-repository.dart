import 'dart:developer';
import 'dart:io';

import 'package:core/common/exception.dart';
import 'package:core/common/failure.dart';
import 'package:core/common/network-info.dart';
import 'package:core/data/datasources/meal/local-datasource.dart';
import 'package:core/data/datasources/meal/remote-datasource.dart';
import 'package:core/domain/entities/category.dart';
import 'package:core/domain/entities/meal.dart';
import 'package:core/domain/repositories/meal-repository.dart';
import 'package:dartz/dartz.dart';

class MealRepositoryImpl extends MealRepository {
  final MealLocalDatasource localDatasource;
  final MealRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  MealRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
    required this.networkInfo,
  });

  @override
  Stream<Either<Failure, Iterable<Category>>> getCategories() async* {
    bool hasLocalData = false;

    try {
      final cached = await localDatasource.getCategoriesCache();

      yield Right(cached.map((e) => e.toEntity));

      hasLocalData = true;
    } catch (e, trace) {
      log('no local data', error: e, stackTrace: trace);
    }

    if(!await networkInfo.isConnected) {
      if(!hasLocalData) {
        yield Left(ConnectionFailure());
      }
    }

    try {
      final categories = (await remoteDatasource.getCategories())
          .map((e) => e.toEntity);

      final temp = await Future.wait([
        localDatasource.saveCategories(categories)
      ]);

      yield Right(categories);
    } on ServerException catch (e, trace) {
      log('ServerException ${e.message}', error: e, stackTrace: trace);

      if(!hasLocalData) {
        yield Left(ServerFailure(
          message: e.message ?? e.toString(),
        ));
      }
    } on TlsException catch (e, trace) {
      log('TlsException', error: e, stackTrace: trace);

      if(!hasLocalData) {
        yield Left(CommonFailure('Certificate Not Valid:\n${e.message}'));
      }
    } on DatabaseException catch (e, trace) {
      log('databaseexception ${e.message}', error: e, stackTrace: trace);

      if(!hasLocalData) {
        yield Left(DatabaseFailure(message: e.message));
      }
    } catch (e, trace) {
      log('error', error: e, stackTrace: trace);

      if(!hasLocalData) {
        yield Left(CommonFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Iterable<Meal>>> getFavorites() async {
    try {
      final result = await localDatasource.getFavorites();

      return Right(result.map((e) => e.toEntity));
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);

      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, Iterable<Meal>>> getMealPerCategory(Category category) async* {
    bool hasLocalData = false;

    try {
      final cached = await localDatasource.getMealsByCategoryCache(category);

      yield Right(cached.map((e) => e.toEntity));

      hasLocalData = true;
    } catch (e, trace) {
      log('no local data', error: e, stackTrace: trace);
    }
    
    if(!await networkInfo.isConnected) {
      if(!hasLocalData) {
        yield Left(ConnectionFailure());
      }
    }

    try {
      final meals = (await remoteDatasource.getMealsByCategory(
        category
      )).map((e) => e.toEntity);

      final temp = await Future.wait([
        localDatasource.saveMeals(meals)
      ]);

      yield Right(meals);
    } on ServerException catch (e, trace) {
      log('ServerException ${e.message}', error: e, stackTrace: trace);

      if(!hasLocalData) {
        yield Left(ServerFailure(
          message: e.message ?? e.toString(),
        ));
      }
    } on TlsException catch (e, trace) {
      log('TlsException', error: e, stackTrace: trace);

      if(!hasLocalData) {
        yield Left(CommonFailure('Certificate Not Valid:\n${e.message}'));
      }
    } on DatabaseException catch (e, trace) {
      log('databaseexception ${e.message}', error: e, stackTrace: trace);

      if(!hasLocalData) {
        yield Left(DatabaseFailure(message: e.message));
      }
    } catch (e, trace) {
      log('error', error: e, stackTrace: trace);

      if(!hasLocalData) {
        yield Left(CommonFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> newFavorite(Meal meal) async {
    try {
      final result = await localDatasource.newFavorite(meal);

      if(result != 0) {
        return const Right('oke');
      }

      return Left(CacheFailure(
        message: 'failed'
      ));
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);

      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeFromFavorite(String idMeal) async {
    try {
      final result = await localDatasource.removeFavorite(idMeal);

      if(result != 0) {
        return const Right('oke');
      }

      return Left(CacheFailure(
          message: 'failed'
      ));
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);

      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Iterable<Meal>>> searchMealByQuery(String query) async {
    try {
      if(!await networkInfo.isConnected) {
        throw Exception('Disconnected from network');
      }
      
      final result = await remoteDatasource.searchMealsByQuery(query);

      return Right(result.map((e) => e.toEntity));
    } catch(e, trace) {
      log('error', error: e, stackTrace: trace);

      return Left(CommonFailure(e.toString()));
    }
  }

}