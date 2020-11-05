import 'package:flutter/material.dart';
import 'package:meal_app_academind/model/meal.dart';
import 'package:meal_app_academind/widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> _favorites;

  FavoritesScreen(this._favorites);

  @override
  Widget build(BuildContext context) {
    if (_favorites.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Favorites"),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            final meal = _favorites[index];
            return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              affordability: meal.affordability,
            );
          },
          itemCount: _favorites.length,
        ),
      );
    }
  }
}