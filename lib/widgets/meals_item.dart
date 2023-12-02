import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  final Meal meal;
  const MealsItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
            height: 50,
            child: Container(
              // padding: const EdgeInsets.all(8),
              color: Colors.black54,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(meal.title,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
