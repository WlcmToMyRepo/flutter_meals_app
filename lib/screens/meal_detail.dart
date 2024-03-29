import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourite_meal_provider.dart';

// this widget will display the data of selected meal like name image ...

class MealDetailScreen extends ConsumerWidget {
  final Meal meal;
  const MealDetailScreen({super.key, required this.meal});

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
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: [FavButton(meal: meal)]),
      body: ListView(
        children: [
          Image.network(meal.imageUrl),
          heading(context, "Ingredients"),
          Column(
            children: [
              for (String ings in meal.ingredients)
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
                for (String step in meal.steps)
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

class FavButton extends ConsumerWidget {
  final Meal meal;
  const FavButton({super.key, required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFavourite = ref.watch(favouriteMealProvider).contains(meal);
    return IconButton(
        onPressed: () {
          ref.read(favouriteMealProvider.notifier).toggleFavourite(meal);
        },
        icon: isFavourite
            ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
            : const Icon(
                Icons.star_border,
              ));
  }
}
