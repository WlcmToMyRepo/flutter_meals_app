import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourite_meal_provider.dart';

// this widget will display the data of selected meal like name image ...
class MealDetailsScreen extends ConsumerStatefulWidget {
  final Meal meal;
  //method to access toggle function of tab screen
  const MealDetailsScreen({super.key, required this.meal});

  @override
  ConsumerState<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends ConsumerState<MealDetailsScreen> {
  Widget heading(BuildContext context, title) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.meal.title),
          actions: [FavButton(meal: widget.meal)]),
      body: ListView(
        children: [
          Image.network(widget.meal.imageUrl),
          heading(context, "Ingredients"),
          Column(
            children: [
              for (String ings in widget.meal.ingredients)
                Text(
                  ings,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
            ],
          ),
          heading(context, "Steps"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                for (String step in widget.meal.steps)
                  Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FavButton extends ConsumerStatefulWidget {
  final Meal meal;

  const FavButton({super.key, required this.meal});

  @override
  ConsumerState<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends ConsumerState<FavButton> {
  @override
  Widget build(BuildContext context) {
    bool isFavourite =
        ref.read(favouriteMealProvider.notifier).mealIsFavourite(widget.meal);
    return IconButton(
      onPressed: () {
        ref.read(favouriteMealProvider.notifier).toggleFavourite(widget.meal);
        isFavourite = ref
            .watch(favouriteMealProvider.notifier)
            .mealIsFavourite(widget.meal);
        setState(() {});
      },
      icon: Icon(
        Icons.star,
        color: isFavourite ? Colors.yellow : Colors.white,
      ),
    );
  }
}
