import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widget/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/fa';
  final List<Meal> favArr;
  FavouriteScreen(this.favArr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: favArr.length,
            itemBuilder: (context, index) {
              return MealItem(
                id: favArr[index].id,
                title: favArr[index].title,
                affordability: favArr[index].affordability,
                complexity: favArr[index].complexity,
                duration: favArr[index].duration,
              );
            }),
      ),
    );
  }
}
