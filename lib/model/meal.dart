import 'package:flutter/cupertino.dart';

enum Complexity { SIMPLE, CHALLENGING, HARD }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});

  static String complexityText(complexity) {
    switch (complexity) {
      case Complexity.SIMPLE:
        return 'Simple';
      case Complexity.CHALLENGING:
        return 'Challenging';
      case Complexity.HARD:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  static String affordabilityText(affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }
}
