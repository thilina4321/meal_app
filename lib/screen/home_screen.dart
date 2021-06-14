import 'package:flutter/material.dart';

import '../screen/category_meal_screen.dart';
import '../dummy_data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map((item) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CategoryMealScreen.routerName,
                arguments: {'title': item.title, 'id': item.id});
          },
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: item.color,
              elevation: 30,
              color: item.color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.title,
                  style: Theme.of(context).textTheme.headline1,
                ),
              )),
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
