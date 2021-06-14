import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screen/appBar_tabs_screen.dart';
import 'package:meal_app/screen/favourite_screen.dart';
import 'package:meal_app/screen/fliters_screen.dart';

import './screen/category_meal_screen.dart';
import './screen/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availableMeals = DUMMY_MEALS;
  bool glueFree = false;
  bool isFav = false;
  List<Meal> favArr = [];

  void _filterFav(String id, bool favStatus) {
    isFav = favStatus;
    int getIndex = favArr.indexWhere((meal) => meal.id == id);
    if (getIndex >= 0) {
      favArr.removeAt(getIndex);
    } else {
      favArr.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
    }
  }

  void _filterGluteenFree(bool gluFree) {
    glueFree = !glueFree;
    availableMeals = DUMMY_MEALS.where((meal) {
      if (gluFree && !meal.isGlutenFree) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      routes: {
        '/': (ctx) => AppBarTabScreen(favArr),
        CategoryMealScreen.routerName: (ctx) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              isFav,
              _filterFav,
            ),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(glueFree, _filterGluteenFree),
        FavouriteScreen.routeName: (ctx) => FavouriteScreen(favArr)
      },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) {
      //     return CategoryMealScreen();
      //   });
      // },
    );
  }
}
