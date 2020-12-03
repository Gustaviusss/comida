import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../data/dummy_data.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;

  FavoritesScreen(this.favorites);
  @override
  Widget build(BuildContext context) {
    int mealCount = DUMMY_MEALS.length;
    return Center(
        child: ListView.builder(
      itemCount: mealCount,
      itemBuilder: (context, index) {
        return MealItem(
            id: DUMMY_MEALS[index].id,
            imageUrl: DUMMY_MEALS[index].imageUrl,
            title: DUMMY_MEALS[index].title,
            duration: DUMMY_MEALS[index].duration,
            complexity: DUMMY_MEALS[index].complexity,
            affordability: DUMMY_MEALS[index].affordability);
      },
    ));
  }
}
