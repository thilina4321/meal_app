import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import '../screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final imageUrl = 'assets/dog.PNG';
  final String id;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;

  String get complexityStatus {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityStatus {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  const MealItem(
      {this.id,
      this.title,
      this.affordability,
      this.complexity,
      this.duration});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealDetailScreen.routeName, arguments: {'id': id});
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                      width: 200,
                      color: Colors.black54,
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                )
              ],
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.schedule),
                        Text('${duration.toString()} min')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [Icon(Icons.work), Text(complexityStatus)],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.golf_course_outlined),
                        Text(affordabilityStatus)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
