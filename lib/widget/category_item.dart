import 'package:flutter/material.dart';
import 'package:meal_app_academind/route/routes.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  //used for navigating between the screens
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Routes.CATEGORY_MEAL, arguments:
    {'id': id, 't': title});

    //navigator set up connected to the context
    // Navigator.of(ctx).push(MaterialPageRoute(
    //   builder: (_) {
    //     return CategoryMealsScreen(id, title);
    //   }
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // here we want to go to a different page
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.4), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
