import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

// this widget will display the data of selected meal like name image ...
class MealDetailsScreen extends StatefulWidget {
  final Meal meal;
  //method to access toggle function of tab screen
  final void Function(Meal) toggleFavourite;
  const MealDetailsScreen(
      {super.key, required this.meal, required this.toggleFavourite});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
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

  bool isFavourite = false;
  void toggle() {
    setState(() {
      isFavourite = !isFavourite;
      //we are calling the tab screen's toggle method here
      widget.toggleFavourite(widget.meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.meal.title), actions: [
        IconButton(
            onPressed: toggle,
            icon: Icon(Icons.star,
                color: isFavourite ? Colors.yellow : Colors.white))
      ]),
      body: ListView(
        children: [
          Image.network(widget.meal.imageUrl),
          heading(context, "Ingredients"),
          Column(
            children: [
              for (String ings in widget.meal.ingredients)
                Text(ings,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ))
            ],
          ),
          heading(context, "Steps"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                for (String step in widget.meal.steps)
                  Text(step,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool isFavourite = false;
  void toggle() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: toggle,
        icon: Icon(Icons.star,
            color: isFavourite ? Colors.yellow : Colors.white));
  }
}
