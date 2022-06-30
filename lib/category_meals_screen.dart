import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'category-meals';
  // final String categoryiD;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryiD, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryiD = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryiD);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryiD!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
