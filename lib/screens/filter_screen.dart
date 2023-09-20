import 'package:flutter/material.dart';
import 'package:food_heart/widgets/main_drrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters-screen';

  final Function setFilterHandler;
  final Map<String, bool> currentfilters;
  const FiltersScreen(
      {super.key,
      required this.setFilterHandler,
      required this.currentfilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentfilters['gluten-free']!;
    _isLactoseFree = widget.currentfilters['lactose-free']!;
    _isVegan = widget.currentfilters['vegan']!;
    _isVegetarian = widget.currentfilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
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
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten-free': _isGlutenFree,
                'lactose-free': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.setFilterHandler(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
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
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  _isGlutenFree,
                  (value) {
                    setState(() {
                      _isGlutenFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose-free meals',
                  _isLactoseFree,
                  (value) {
                    setState(() {
                      _isLactoseFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _isVegan,
                  (value) {
                    setState(() {
                      _isVegan = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _isVegetarian,
                  (value) {
                    setState(() {
                      _isVegetarian = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
