import 'package:core/domain/entities/meal.dart';
import 'package:flutter/material.dart';
import 'package:meal_explore/presentation/pages/meals/components/meal-tile.dart';

class MealList extends StatelessWidget {
  final Iterable<Meal> meals;
  final VoidCallback? onAfterDetail;

  const MealList({
    Key? key,
    required this.meals,
    this.onAfterDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.2
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealTile(
          meal: meals.elementAt(index),
          onAfterDetail: onAfterDetail,
        );
      },
    );
  }
}
