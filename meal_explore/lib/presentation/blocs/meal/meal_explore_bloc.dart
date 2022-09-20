import 'dart:async';

import 'package:core/domain/entities/category-detail.dart';
import 'package:core/domain/entities/meal-detail.dart';
import 'package:core/domain/entities/meal.dart';
import 'package:core/domain/usecases/get-categories.dart';
import 'package:core/domain/usecases/get-meals-by-category.dart';
import 'package:core/domain/usecases/search-meal.dart';
import 'package:core/domain/usecases/get-favorites.dart';
import 'package:core/domain/usecases/new-favorite.dart';
import 'package:core/domain/usecases/remove-favorite.dart';
import 'package:core/domain/usecases/get-meal-detail.dart';
import 'package:core/common/state-enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'meal_explore_event.dart';
part 'meal_explore_state.dart';

class MealExploreBloc extends Bloc<MealExploreEvent, MealExploreState> {
  final GetCategories getCategories;
  final GetMealsByCategory getMealsByCategory;
  final SearchMeal searchMeal;
  final GetFavorites getFavorites;
  final NewFavorites newFavorites;
  final RemoveFavorites removeFavorite;
  final GetMealDetail getMealDetail;

  MealExploreBloc({
    required this.getCategories,
    required this.getMealsByCategory,
    required this.searchMeal,
    required this.removeFavorite,
    required this.newFavorites,
    required this.getFavorites,
    required this.getMealDetail,
  }) : super(MealExploreState.initial()) {
    on<MealExploreRequestCategoryEvent>(_onReqCategories);
    on<MealExploreRequestMealsByCategoryEvent>(_onReqMealByCategory);
    on<MealExploreRequestMealsByQueryEvent>(_onReqMealByQuery);
    on<MealExploreRequestMealsByFavorited>(_onReqMealByFavorite);
    on<MealExploreMakeFavoriteEvent>(_onReqMakeMealFavorite);
    on<MealExploreRemoveFavoriteEvent>(_onReqRemoveMealFavorite);
    on<MealExploreRequestMealDetailEvent>(_onReqMealDetail);
  }

  FutureOr<void> _onReqCategories(MealExploreRequestCategoryEvent event, Emitter<MealExploreState> emit) async {
    emit(
      state.copyWith(
        stateCategories: RequestState.Loading,
        mealCategories: List.empty()
      )
    );

    StreamSubscription? sub;
    final completer = Completer();

    final stream = getCategories.execute()..doOnDone(() {
      sub?.cancel();
    });

    sub = stream.listen((result) {
      result.fold(
        (l) => emit(state.copyWith(
          stateCategories: RequestState.Error,
          message: l.message,
        )),
        (r) => emit(state.copyWith(
          stateCategories: RequestState.Loaded,
          mealCategories: r,
        ))
      );
    }, onDone: () {
      completer.complete();
    });

    await completer.future;
  }

  FutureOr<void> _onReqMealByCategory(MealExploreRequestMealsByCategoryEvent event, Emitter<MealExploreState> emit) async {
    emit(
      state.copyWith(
        stateMeals: RequestState.Loading,
        meals: List.empty()
      )
    );

    StreamSubscription? sub;
    final completer = Completer();

    final stream = getMealsByCategory.execute(event.category)..doOnDone(() {
      sub?.cancel();
    });

    sub = stream.listen((result) {
      result.fold(
        (l) => emit(state.copyWith(
          stateMeals: RequestState.Error,
          message: l.message,
        )),
        (r) => emit(state.copyWith(
          stateMeals: RequestState.Loaded,
          meals: r.toList(),
        ))
      );
    }, onDone: () {
      completer.complete();
    });

    await completer.future;
  }

  FutureOr<void> _onReqMealByQuery(MealExploreRequestMealsByQueryEvent event, Emitter<MealExploreState> emit) async {
    emit(
      state.copyWith(
        stateMeals: RequestState.Loading,
        meals: List.empty()
      )
    );

    final result = await searchMeal.execute(event.query);

    result.fold(
      (l) => emit(state.copyWith(
        stateMeals: RequestState.Error,
        message: l.message,
      )),
      (r) => emit(state.copyWith(
        stateMeals: RequestState.Loaded,
        meals: r.toList(),
      ))
    );
  }

  FutureOr<void> _onReqMealByFavorite(MealExploreRequestMealsByFavorited event, Emitter<MealExploreState> emit) async {
    emit(
      state.copyWith(
        stateFavoriteMeals: RequestState.Loading,
        favoriteMeals: List.empty()
      )
    );

    final result = await getFavorites.execute();

    result.fold(
      (l) => emit(state.copyWith(
        stateFavoriteMeals: RequestState.Error,
        message: l.message,
      )),
      (r) => emit(state.copyWith(
        stateFavoriteMeals: RequestState.Loaded,
        favoriteMeals: r.toList(),
      ))
    );
  }

  FutureOr<void> _onReqMakeMealFavorite(MealExploreMakeFavoriteEvent event, Emitter<MealExploreState> emit) async {
    emit(
      state.copyWith(
        stateUpdateFavorite: RequestState.Loading,
      )
    );

    final result = await newFavorites.execute(event.idMeal);

    result.fold(
      (l) => emit(state.copyWith(
        stateUpdateFavorite: RequestState.Error,
        message: l.message,
      )),
      (r) {
        final idx = state.meals.indexWhere((element) => element.id==event.idMeal);

        if(idx!=-1) {
          state.meals[idx] = Meal(
            name: state.meals[idx].name,
            id: state.meals[idx].id,
            favorite: true,
            thumbnail: state.meals[idx].thumbnail,
            category: state.meals[idx].category,
          );
        }

        emit(state.copyWith(
          stateUpdateFavorite: RequestState.Loaded,
        ));
      }
    );
  }

  FutureOr<void> _onReqRemoveMealFavorite(MealExploreRemoveFavoriteEvent event, Emitter<MealExploreState> emit) async {
    emit(
      state.copyWith(
        stateUpdateFavorite: RequestState.Loading,
      )
    );

    final result = await removeFavorite.execute(event.idMeal);

    result.fold(
      (l) => emit(state.copyWith(
        stateUpdateFavorite: RequestState.Error,
        message: l.message,
      )),
      (r) {
        final idx = state.meals.indexWhere((element) => element.id==event.idMeal);

        if(idx!=-1) {
          state.meals[idx] = Meal(
            name: state.meals[idx].name,
            id: state.meals[idx].id,
            favorite: false,
            thumbnail: state.meals[idx].thumbnail,
            category: state.meals[idx].category,
          );
        }

        emit(state.copyWith(
          stateUpdateFavorite: RequestState.Loaded,
        ));
      }
    );
  }

  FutureOr<void> _onReqMealDetail(MealExploreRequestMealDetailEvent event, Emitter<MealExploreState> emit) async {
    emit(
      state.copyWith(
        stateMealDetail: RequestState.Loading,
        mealDetail: null,
      )
    );

    StreamSubscription? sub;
    final completer = Completer();

    final stream = getMealDetail.execute(event.idMeal)..doOnDone(() {
      sub?.cancel();
    });

    sub = stream.listen((result) {
      result.fold(
        (l) => emit(state.copyWith(
          stateMealDetail: RequestState.Error,
          message: l.message,
        )),
        (r) => emit(state.copyWith(
          stateMealDetail: RequestState.Loaded,
          mealDetail: r,
        ))
      );
    }, onDone: () {
      completer.complete();
    });

    await completer.future;
  }
}
