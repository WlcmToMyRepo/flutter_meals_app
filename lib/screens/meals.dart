import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meal_detail.dart';
// import 'package:meals/experiment/stack_widget.dart';
import 'package:meals/widgets/meals_item.dart';
import 'package:meals/models/meal.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  final void Function(Meal)
      toggleFunction; //method to access toggle function of tab screen
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.toggleFunction});

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealDetailsScreen(
                  meal: meal,
                  toggleFavourite: toggleFunction,
                )));
  }

  @override
  Widget build(BuildContext context) {
    //when there is no data in mealsdata
    Widget body = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Uh oh ... nothing here",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
    // when there is data in meals data
    if (meals.isNotEmpty) {
      body = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealsItem(
          meal: meals[index],
          selectMeal: (meal) {
            _selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return body;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: body,
    );
  }
}
