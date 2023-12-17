import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meal_provider.dart';

enum Filter {
  glutenFree,
  lactosFree,
  vegetarian,
  vegan,
}

class FilterProvider extends StateNotifier<Map<Filter, bool>> {
  FilterProvider()
      : super({
          Filter.glutenFree: false,
          Filter.lactosFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFiltersFromMap(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
        (ref) => FilterProvider());

final filteredMealsProvider = Provider((ref) {
  final selectedFilter = ref.watch(filtersProvider);
  final meals = ref.watch(mealsProvider);
  return meals.where((meal) {
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
});
