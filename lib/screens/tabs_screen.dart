import 'package:flutter/material.dart';
import 'package:food_heart/screens/categories_screen.dart';
import 'package:food_heart/screens/favorites_screen.dart';

import '../models/meal.dart';
import '../widgets/main_drrawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favMeals;
  const TabsScreen({super.key, required this.favMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const CategoriesScreen(),
    const FavoritesScreen(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Heart'),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

//Following code is for tabs with top navigation bar i-e tabBar and TabBarView widgets. 

// import 'package:flutter/material.dart';
// import 'package:food_heart/screens/categories_screen.dart';
// import 'package:food_heart/screens/favorites_screen.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({super.key});

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Food Heart'),
//             bottom: const TabBar(
//               tabs: [
//                 Tab(
//                   icon: Icon(Icons.category),
//                   text: 'Categories',
//                 ),
//                 Tab(
//                   icon: Icon(Icons.star),
//                   text: 'Favorites',
//                 )
//               ],
//             ),
//           ),
//           body: const TabBarView(
//             children: [
//               CategoriesScreen(),
//               FavoritesScreen(),
//             ],
//           )),
//     );
//   }
// }
