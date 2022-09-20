part of 'meal_explore_bloc.dart';

@immutable
abstract class MealExploreEvent {}

class MealExploreRequestCategoryEvent extends MealExploreEvent {}

class MealExploreRequestMealsByCategoryEvent extends MealExploreEvent {
  final CategoryDetail category;

  MealExploreRequestMealsByCategoryEvent(this.category);
}

class MealExploreRequestMealsByQueryEvent extends MealExploreEvent {
  final String query;

  MealExploreRequestMealsByQueryEvent(this.query);
}

class MealExploreRequestMealsByFavorited extends MealExploreEvent {}

class MealExploreMakeFavoriteEvent extends MealExploreEvent {
  final String idMeal;

  MealExploreMakeFavoriteEvent(this.idMeal);
}

class MealExploreRemoveFavoriteEvent extends MealExploreEvent {
  final String idMeal;

  MealExploreRemoveFavoriteEvent(this.idMeal);
}

class MealExploreRequestMealDetailEvent extends MealExploreEvent {
  final String idMeal;

  MealExploreRequestMealDetailEvent(this.idMeal);
}