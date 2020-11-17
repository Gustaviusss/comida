import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
    final List<Meal> favorites;

    FavoritesScreen(this.favorites);
  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty){
      return Center(
        child: Text('You have no favorites yet, start adding some', style: TextStyle(fontSize: 36),textAlign: TextAlign.center,)
    );
  } else{
    return ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favorites[index].id,
                imageUrl: favorites[index].imageUrl,
                title: favorites[index].title,
                duration: favorites[index].duration,
                complexity: favorites[index].complexity,
                affordability: favorites[index].affordability
              );
            },
            itemCount: favorites.length);
  }
  }
}