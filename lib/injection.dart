import 'package:core/common/instance.dart';
import 'package:core/common/network-info.dart';
import 'package:core/data/datasources/meal/dio-datasource.dart';
import 'package:core/data/datasources/meal/local-datasource.dart';
import 'package:core/data/datasources/meal/moor-datasource.dart';
import 'package:core/data/datasources/meal/moor-helper/database.dart';
import 'package:core/data/datasources/meal/remote-datasource.dart';
import 'package:core/data/respositories/meal-repository.dart';
import 'package:core/domain/repositories/meal-repository.dart';
import 'package:core/domain/usecases/get-categories.dart';
import 'package:core/domain/usecases/get-favorites.dart';
import 'package:core/domain/usecases/get-meals-by-category.dart';
import 'package:core/domain/usecases/new-favorite.dart';
import 'package:core/domain/usecases/remove-favorite.dart';
import 'package:core/domain/usecases/search-meal.dart';
import 'package:core/domain/usecases/get-meal-detail.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meal_explore/presentation/blocs/meal/meal_explore_bloc.dart';

void initInjection() {
  locator.allowReassignment = true;
  
  locator.registerFactory(() => MealExploreBloc(
    getCategories: locator(),
    getMealsByCategory: locator(),
    searchMeal: locator(),
    getFavorites: locator(),
    newFavorites: locator(),
    removeFavorite: locator(),
    getMealDetail: locator(),
  ));
  
  
  locator.registerLazySingleton(() => GetCategories(locator()));
  
  locator.registerLazySingleton(() => GetFavorites(locator()));
  
  locator.registerLazySingleton(() => GetMealsByCategory(
    mealRepository: locator())
  );
  
  locator.registerLazySingleton(() => NewFavorites(locator()));
  
  locator.registerLazySingleton(() => RemoveFavorites(locator()));
  
  locator.registerLazySingleton(() => SearchMeal(locator()));

  locator.registerLazySingleton(() => GetMealDetail(locator()));


  locator.registerLazySingleton<MealRepository>(() => MealRepositoryImpl(
    localDatasource: locator(),
    remoteDatasource: locator(), 
    networkInfo: locator(),
  ));
  
  
  locator.registerLazySingleton<MealLocalDatasource>(() => MealMoorDatasource(
    mealDatabase: locator(),
  ));
  
  locator.registerLazySingleton<MealRemoteDatasource>(() => MealDioDatasource(
    locator(),
  ));
  
  
  locator.registerLazySingleton(() => dio);
  locator.registerLazySingleton(() => DataConnectionChecker());
  locator.registerLazySingleton(() => MealDatabase());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
    locator()
  ));
}