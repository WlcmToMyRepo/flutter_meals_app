import 'package:meals/models/meal.dart';
import 'package:riverpod/riverpod.dart';

class FavouriteMealProvider extends StateNotifier<List<Meal>> {
  FavouriteMealProvider() : super([]);

  bool mealIsFavourite(Meal meal) {
    return state.contains(meal);
  }

  void toggleFavourite(Meal meal) {
    if (mealIsFavourite(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteMealProvider, List<Meal>>(
        (ref) => FavouriteMealProvider());
