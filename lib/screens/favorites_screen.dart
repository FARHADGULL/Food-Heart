import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favMeals;
  const FavoritesScreen(this.favMeals, {Key? key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You have no favorites yet - start adding some!'),
    );
  }
}
