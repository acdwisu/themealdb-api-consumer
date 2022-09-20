part of 'meal_explore_bloc.dart';

@immutable
class MealExploreState {
  final Iterable<CategoryDetail> mealCategories;
  final Iterable<Meal> meals;
  final MealDetail? mealDetail;
  final RequestState stateCategories;
  final RequestState stateMeals;
  final RequestState stateUpdateFavorite;
  final RequestState stateMealDetail;
  final String message;

  const MealExploreState({
    required this.mealCategories, 
    required this.meals,
    required this.mealDetail,
    required this.stateCategories, 
    required this.stateMeals,
    required this.stateUpdateFavorite,
    required this.stateMealDetail,
    required this.message,
  });
  
  MealExploreState copyWith({
    Iterable<CategoryDetail>? mealCategories,
    Iterable<Meal>? meals,
    MealDetail? mealDetail,
    RequestState? stateCategories,
    RequestState? stateMeals,
    RequestState? stateUpdateFavorite,
    RequestState? stateMealDetail,
    String? message,
  }) => MealExploreState(
    mealCategories: mealCategories ?? this.mealCategories,
    meals: meals ?? this.meals,
    mealDetail: [RequestState.Empty, RequestState.Loading].contains(stateMealDetail)? mealDetail : mealDetail ?? this.mealDetail,
    stateCategories: stateCategories ?? this.stateCategories,
    stateMeals: stateMeals ?? this.stateMeals,
    stateUpdateFavorite: stateUpdateFavorite ?? this.stateUpdateFavorite,
    stateMealDetail: stateMealDetail ?? this.stateMealDetail,
    message: message ?? this.message,
  );

  factory MealExploreState.initial() => const MealExploreState(
    meals: [],
    mealCategories: [],
    mealDetail: null,
    stateMeals: RequestState.Empty,
    stateCategories: RequestState.Empty,
    stateUpdateFavorite: RequestState.Empty,
    stateMealDetail: RequestState.Empty,
    message: '',
  );
}
