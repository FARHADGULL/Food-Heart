import 'package:flutter/material.dart';
import 'package:food_heart/widgets/main_drrawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = 'filters-screen';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters!'),
      ),
    );
  }
}
