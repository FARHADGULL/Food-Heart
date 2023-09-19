import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            color: Theme.of(context).primaryColor,
            child: const Text(
              'Food Heart',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
