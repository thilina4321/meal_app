import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widget/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routerName = '/category_meal';
  final List availableMeals;
  CategoryMealScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
          itemCount: categoryMeal.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeal[index].id,
              title: categoryMeal[index].title,
              affordability: categoryMeal[index].affordability,
              complexity: categoryMeal[index].complexity,
              duration: categoryMeal[index].duration,
            );
          }),
    );
  }
}
