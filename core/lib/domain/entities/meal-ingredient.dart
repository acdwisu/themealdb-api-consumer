import 'package:equatable/equatable.dart';

class MealIngredient extends Equatable {
  final String stuff;
  final String measurement;

  const MealIngredient({required this.stuff, required this.measurement});

  @override
  List<Object?> get props => [stuff, measurement];
}