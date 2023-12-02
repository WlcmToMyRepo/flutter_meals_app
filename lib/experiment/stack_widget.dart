import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meals/data/dummy_data.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Stack Demo"),
          ),
          body: ListView.builder(
            itemCount: dummyMeals.length,
            itemBuilder: (context, index) => MealsItem(meal: dummyMeals[index]),
          )

          /*Container(
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                width: 2,
              )),
          child: 
            Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200,
              color: Colors.yellow,
              width: MediaQuery.of(context).size.width,
              child: FadeInImage(
                fadeInDuration: const Duration(seconds: 3),
                placeholder: MemoryImage(kTransparentImage),
                fit: BoxFit.cover,
                image: const NetworkImage(
                    "https://cdn.britannica.com/97/158797-050-ABECB32F/North-Cascades-National-Park-Lake-Ann-park.jpg?w=400&h=300&c=crop"),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black54,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: const Text("Hi",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    )),
              ),
            )
            Positioned(
                height: 200,
                width: double.infinity,
                child: FadeInImage(
                  fadeInDuration: const Duration(seconds: 3),
                  placeholder: MemoryImage(kTransparentImage),
                  fit: BoxFit.cover,
                  image: const NetworkImage(
                      "https://cdn.britannica.com/97/158797-050-ABECB32F/North-Cascades-National-Park-Lake-Ann-park.jpg?w=400&h=300&c=crop"),
                ),
              ),
              const Positioned(
                child: Text(
                  "Hi",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),*/

          ),
    );
  }
}

class MealsItem extends StatelessWidget {
  final Meal meal;
  const MealsItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        margin: const EdgeInsets.all(8),
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: FadeInImage(
          alignment: Alignment.center,
          placeholder: MemoryImage(kTransparentImage),
          fit: BoxFit.cover,
          image: NetworkImage(meal.imageUrl),
        ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          color: Colors.black54,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Text(meal.title,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              )),
        ),
      )
    ]);
  }
}
