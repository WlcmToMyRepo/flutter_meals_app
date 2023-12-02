import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
// import 'package:meals/experiment/stack_widget.dart';
import 'package:meals/widgets/meals_item.dart';
import 'package:meals/models/meal.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  const MealsScreen({super.key, required this.title, required this.meals});

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
        itemCount: dummyMeals.length,
        itemBuilder: (context, index) => MealsItem(meal: dummyMeals[index]),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
