import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filter.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/app_drawer.dart';

//default filter

const Map<Filter, bool> kMealsFilter = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

//this widget is home screen of the app with bottom navigation bar
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favouriteMeals = [];
  int _selectedIndex = 0;
  String selectedTitle = "Categories";
  Map<Filter, bool> selectedFilter = kMealsFilter;

  void selectScreen(String screen) async {
    if (screen == "meals") {
      Navigator.pop(context);
    } else if (screen == 'filter') {
      Navigator.pop(context);
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (context) => FilterScreen(filter: selectedFilter)));

      print("RESULT >>>>>> $result");

      //assign result to selectedFilters
      selectedFilter = result ?? kMealsFilter;
      setState(() {});
    }
  }

  void showNotification(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  //this method allows us to mark meals as favorites
  //we need to pass this method to the child widgets
  //in the meal details screen we need to exicute the method
  void toggleFavourite(Meal meal) {
    print('I AM CALLED >>>>>>>>>>>>>>>');
    if (_favouriteMeals.contains(meal)) {
      _favouriteMeals.remove(meal);
      showNotification("meal removed from favourites");
    } else {
      print('removed meal $meal');
      _favouriteMeals.add(meal);
      showNotification("meal added to favourites");
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

  //this method wil lapply filter on dummyMeals and return filtered meals
  List<Meal> get getFilteredMeals {
    return dummyMeals.where((meal) {
      //need to filter gluten free
      if (selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (selectedFilter[Filter.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    print("LACTOS FREE MEAL: >>>> $getFilteredMeals");
    Widget tabPage = CategoriesScreen(
      categories: data,
      toggleFavourite: toggleFavourite,
      meals: getFilteredMeals,
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
      drawer: AppDrawer(
        selectScreen: selectScreen,
      ),
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
