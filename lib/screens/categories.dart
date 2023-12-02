import 'package:flutter/material.dart';
import 'package:meals/models/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/gridview_item.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;
  const CategoriesScreen({super.key, required this.categories});

  //This will navigate to meals screeen
  void _selectCategory(BuildContext context, Category category) {
    final filteredMealsOnCategory = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: "Meals", meals: filteredMealsOnCategory)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pick your category'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        itemCount: categories.length,
        itemBuilder: (context, index) => GridViewItem(
            //Navigates to mealsccreen
            data: categories[index],
            navigateFunction: () {
              _selectCategory(
                  context,
                  categories[
                      index]); //this func call will return selecterCategoryData
            }),
      ),
    );
  }
}
