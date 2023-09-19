import 'package:flutter/material.dart';
import 'package:food_heart/dummy_data.dart';
import 'package:food_heart/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals';

  const CategoryMealsScreen({super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal> categoryMeal = [];

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            title: categoryMeal.elementAt(index).title,
            imageUrl: categoryMeal.elementAt(index).imageUrl,
            duration: categoryMeal.elementAt(index).duration,
            complexity: categoryMeal.elementAt(index).complexity,
            affordability: categoryMeal.elementAt(index).affordability,
            id: categoryMeal.elementAt(index).id,
            removeItem: _removeMeal,
          );
        }),
        itemCount: categoryMeal.length,
      ),
    );
  }
}
