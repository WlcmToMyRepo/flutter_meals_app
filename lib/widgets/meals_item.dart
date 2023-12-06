import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal) selectMeal;
  const MealsItem({super.key, required this.meal, required this.selectMeal});

// getter to get complexity text
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

// getter to get affordability text
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // on tap of this we will navigate meals detail screen
      onTap: () {
        selectMeal(meal);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.hardEdge,
        elevation: 100,
        child: Stack(children: [
          FadeInImage(
            placeholderFit: BoxFit.contain,
            placeholder: MemoryImage(kTransparentImage),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
            image: NetworkImage(meal.imageUrl),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: Colors.black54,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(meal.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: const TextStyle(
                        overflow: TextOverflow.clip,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealMeta(
                        icon: Icons.schedule,
                        label: '${meal.duration} min',
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      MealMeta(
                        icon: Icons.work,
                        label: complexityText,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      MealMeta(
                        icon: Icons.price_change_sharp,
                        label: affordabilityText,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
