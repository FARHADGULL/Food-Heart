import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = 'favorite-screen';

  const FavoritesScreen({
    super.key,
  });

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    bool isFav = false;
    return Center(
      child: Text('You have no favorites yet - start adding some!'),
    );
  }
}
