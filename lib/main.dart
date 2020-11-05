import 'package:flutter/material.dart';
import 'package:meal_app_academind/route/routes.dart';
import 'package:meal_app_academind/screens/filters_screen.dart';
import 'package:meal_app_academind/screens/tabs_screen.dart';

import 'db/dummy_data.dart';
import 'model/meal.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DailyMeal',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.black,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
              ),
        ),
        //home: CategoriesScreen(),
        routes: {
          //main page is '/'
          '/': (ctx) => TabsScreen(_favoriteMeals),
          Routes.CATEGORY_MEAL: (ctx) => CategoryMealsScreen(_availableMeals),
          Routes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
          Routes.FILTERS: (ctx) => FiltersScreen(_filters, _setFilters),
        },
        // ON GENERATE GIVES YOU A LOT OF FLEXIBILITY (for dynamic routing .. )
        // onGenerateRoute: (settings) {
        //   print(settings.arguments);
        //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        // },

        // Usually used for a backup if you don t have a route written.(404 backup:)))
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        });
  }
}
