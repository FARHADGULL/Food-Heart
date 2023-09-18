import 'package:flutter/material.dart';
import 'package:food_heart/screens/categories_screen.dart';
import 'package:food_heart/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Food Heart'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              CategoriesScreen(),
              FavoritesScreen(),
            ],
          )),
    );
  }
}
