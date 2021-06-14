import 'package:flutter/material.dart';
import 'package:meal_app/screen/fliters_screen.dart';
import '../screen/category_meal_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.only(left: 10),
            color: Colors.amber,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              'Meal App',
              style: TextStyle(fontSize: 30),
            ),
          ),
          DrawerLinks(
              title: 'Meal',
              icon: Icons.no_meals,
              link: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          DrawerLinks(
              title: 'Filters',
              icon: Icons.settings,
              link: () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              })
        ],
      ),
    );
  }
}

class DrawerLinks extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function link;
  DrawerLinks({
    @required this.title,
    @required this.icon,
    @required this.link,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Card(
        color: Colors.green,
        child: ListTile(
          onTap: link,
          title: Text(
            title,
            style: TextStyle(color: Colors.purple, fontSize: 25),
          ),
          leading: Icon(
            icon,
            size: 35,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
