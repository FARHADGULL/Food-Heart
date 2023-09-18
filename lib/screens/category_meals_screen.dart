import 'package:flutter/material.dart';
import 'package:food_heart/dummy_data.dart';
import 'package:food_heart/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category_meals';

  const CategoryMealsScreen({super.key});
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen(
  //     {super.key, required this.categoryTitle, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

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
          );
        }),
        itemCount: categoryMeal.length,
      ),
    );
  }
}
