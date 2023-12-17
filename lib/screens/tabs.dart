import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourite_meal_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filter.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/app_drawer.dart';
import 'package:meals/providers/meal_provider.dart';

//default filter

const Map<Filter, bool> kMealsFilter = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

//this widget is home screen of the app with bottom navigation bar
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;
  String selectedTitle = "Categories";

  void selectScreen(String screen) async {
    if (screen == "meals") {
      Navigator.pop(context);
    } else if (screen == 'filter') {
      Navigator.pop(context);
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (context) => const FilterScreen()));

      //assign result to selectedFilters
      setState(() {});
    }
  }

  void showNotification(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  //this method allows us to mark meals as favorites
  //we need to pass this method to the child widgets
  //in the meal details screen we need to exicute the method

  void selectTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //this method wil lapply filter on dummyMeals and return filtered meals
  List<Meal> get getFilteredMeals {
    return ref.watch(filteredMealsProvider);
  }

  @override
  Widget build(BuildContext context) {
    print("LACTOS FREE MEAL: >>>> $getFilteredMeals");
    Widget tabPage = CategoriesScreen(
      categories: data,
      meals: getFilteredMeals,
    );
    if (_selectedIndex == 1) {
      tabPage = MealsScreen(
        meals: ref.watch(favouriteMealProvider),
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
