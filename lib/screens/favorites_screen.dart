import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favMeals;
  final Function setFavoriteHandler;
  const FavoritesScreen(
      {Key? key, required this.favMeals, required this.setFavoriteHandler});

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
          child: Text('You have no favorites yet - start adding some!'));
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            title: favMeals.elementAt(index).title,
            imageUrl: favMeals.elementAt(index).imageUrl,
            duration: favMeals.elementAt(index).duration,
            complexity: favMeals.elementAt(index).complexity,
            affordability: favMeals.elementAt(index).affordability,
            id: favMeals.elementAt(index).id,
            setFavoriteHandler: setFavoriteHandler,
          );
        }),
        itemCount: favMeals.length,
      );
    }
  }
}
