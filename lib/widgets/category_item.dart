import 'package:flutter/material.dart';
import 'package:food_heart/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    super.key,
    required this.title,
    required this.color,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => Navigator.of(context).pushNamed(
        CategoryMealsScreen.routeName,
        arguments: {
          'id': id,
          'title': title,
        },
      ),
      // onTap: () => Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (_) {
      //       return CategoryMealsScreen(
      //         categoryTitle: title,
      //         categoryId: id,
      //       );
      //     },
      //   ),
      // ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title, style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}