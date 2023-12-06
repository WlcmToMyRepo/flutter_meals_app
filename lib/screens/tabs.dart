import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favouriteMeals = [];
  int _selectedIndex = 0;
  String selectedTitle = "Categories";

  void toggleFavourite(Meal meal) {
    print('I AM CALLED >>>>>>>>>>>>>>>');
    if (_favouriteMeals.contains(meal)) {
      _favouriteMeals.remove(meal);
    } else {
      print('removed meal $meal');
      _favouriteMeals.add(meal);
    }
    print('FAVOURITE MEALS --->  | $_favouriteMeals |');
    for (Meal meal in _favouriteMeals) {
      print(meal.title.toUpperCase());
    }
    setState(() {});
  }

  void selectTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget tabPage = CategoriesScreen(
      categories: data,
      toggleFavourite: toggleFavourite,
    );
    if (_selectedIndex == 1) {
      tabPage = MealsScreen(
        meals: _favouriteMeals,
        toggleFunction: toggleFavourite,
      );
      selectedTitle = 'Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTitle),
      ),
      body: tabPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectTab,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
        selectedFontSize: 15,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
