import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';
  final bool checkIsFav;
  final Function addFavToScreen;
  MealDetailScreen(this.checkIsFav, this.addFavToScreen);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  final String imageUrl = 'assets/dog.PNG';
  bool isFav = false;

  @override
  void initState() {
    isFav = widget.checkIsFav;
    super.initState();
  }

  void chageFavState(String id) {
    setState(() {
      isFav = !isFav;
    });
    widget.addFavToScreen(id, isFav);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.checkIsFav);
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = args['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == id;
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => chageFavState(id),
        child: isFav ? Icon(Icons.star_border) : Icon(Icons.star),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    color: Colors.amber,
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Steps',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(selectedMeal.steps[index]),
                );
              },
              itemCount: selectedMeal.steps.length,
            ),
          ),
        ]),
      ),
    );
  }
}
