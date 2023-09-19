import 'package:flutter/material.dart';
import 'package:food_heart/widgets/main_drrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters-screen';
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (newValue) => updateValue(newValue),
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Adjust your meal selection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile('Gluten-Free',
                      'Only include gluten-free meals', _isGlutenFree, (value) {
                    setState(() {
                      _isGlutenFree = value;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
