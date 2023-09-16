import 'package:flutter/material.dart';
import 'package:food_heart/category_item.dart';
import 'package:food_heart/dummy_data.dart';

import 'models/category.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategoryModel> category;

  const CategoriesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Heart'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //defines the width of the grid item
          childAspectRatio: 3 /
              2, // 200 width, 300 height // defines how the items should be sized with respect to height and width relation
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(title: e.title, color: e.color))
            .toList(),
      ),
    );
  }
}
