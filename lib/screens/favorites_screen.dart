import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = 'favorite-screen';

  final List<Meal> favMeals;
  const FavoritesScreen({super.key, required this.favMeals});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('MEalsss'),
    );
  }
}
