import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screen/home_screen.dart';
import 'package:meal_app/widget/main_drawer.dart';

import '../screen/category_meal_screen.dart';
import '../screen/favourite_screen.dart';

class AppBarTabScreen extends StatefulWidget {
  final List<Meal> favArr;
  AppBarTabScreen(this.favArr);
  @override
  _AppBarTabScreenState createState() => _AppBarTabScreenState();
}

class _AppBarTabScreenState extends State<AppBarTabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Category',
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: 'Favourites',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            FavouriteScreen(widget.favArr),
          ],
        ),
      ),
    );
  }
}
