import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter_screen';
  final Function freeGluteen;
  final bool glueFree;
  FiltersScreen(this.glueFree, this.freeGluteen);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isVegan = false;
  bool isVegetarian = false;
  bool isFactoseFree = false;
  bool isGlucoseFree = false;

  Widget _switchListItem(
      String title, String subTitle, bool filterValue, Function updateValue) {
    return SwitchListTile(
      value: filterValue,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    isGlucoseFree = widget.glueFree;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Fliters'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            child: Text(
              'Adjust your meal selection',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _switchListItem('Vegen-Free', 'Only Vegen-free meals', isVegan,
                  (newValue) {
                setState(() {
                  isVegan = newValue;
                });
              }),
              _switchListItem(
                  'Vegetarian', 'Only Vegetarian meals', isVegetarian,
                  (newValue) {
                setState(() {
                  isVegetarian = newValue;
                });
              }),
              _switchListItem(
                  'Factose-Free', 'Only Factose-free meals', isFactoseFree,
                  (newValue) {
                setState(() {
                  isFactoseFree = newValue;
                });
              }),
              _switchListItem(
                  'Glucose-Free', 'Only Glucose-free meals', isGlucoseFree,
                  (newValue) {
                setState(() {
                  isGlucoseFree = newValue;
                  widget.freeGluteen(isGlucoseFree);
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
