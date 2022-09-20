part of 'meal_explore_bloc.dart';

@immutable
class MealExploreState {
  final Iterable<CategoryDetail> mealCategories;
  final List<Meal> meals;
  final List<Meal> favoriteMeals;
  final MealDetail? mealDetail;
  final RequestState stateCategories;
  final RequestState stateMeals;
  final RequestState stateFavoriteMeals;
  final RequestState stateUpdateFavorite;
  final RequestState stateMealDetail;
  final String message;

  const MealExploreState({
    required this.mealCategories, 
    required this.meals,
    required this.favoriteMeals,
    required this.mealDetail,
    required this.stateCategories, 
    required this.stateMeals,
    required this.stateFavoriteMeals,
    required this.stateUpdateFavorite,
    required this.stateMealDetail,
    required this.message,
  });
  
  MealExploreState copyWith({
    Iterable<CategoryDetail>? mealCategories,
    List<Meal>? meals,
    List<Meal>? favoriteMeals,
    MealDetail? mealDetail,
    RequestState? stateCategories,
    RequestState? stateMeals,
    RequestState? stateFavoriteMeals,
    RequestState? stateUpdateFavorite,
    RequestState? stateMealDetail,
    String? message,
  }) => MealExploreState(
    mealCategories: mealCategories ?? this.mealCategories,
    meals: meals ?? this.meals,
    favoriteMeals: favoriteMeals ?? this.favoriteMeals,
    mealDetail: [RequestState.Empty, RequestState.Loading].contains(stateMealDetail)? mealDetail : mealDetail ?? this.mealDetail,
    stateCategories: stateCategories ?? this.stateCategories,
    stateMeals: stateMeals ?? this.stateMeals,
    stateFavoriteMeals: stateFavoriteMeals ?? this.stateFavoriteMeals,
    stateUpdateFavorite: stateUpdateFavorite ?? this.stateUpdateFavorite,
    stateMealDetail: stateMealDetail ?? this.stateMealDetail,
    message: message ?? this.message,
  );

  factory MealExploreState.initial() => const MealExploreState(
    meals: [],
    favoriteMeals: [],
    mealCategories: [],
    mealDetail: null,
    stateMeals: RequestState.Empty,
    stateFavoriteMeals: RequestState.Empty,
    stateCategories: RequestState.Empty,
    stateUpdateFavorite: RequestState.Empty,
    stateMealDetail: RequestState.Empty,
    message: '',
  );
}
