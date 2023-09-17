import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return;
        }),
      ),
    );
  }
}
