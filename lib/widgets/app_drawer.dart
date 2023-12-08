import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final void Function(String screen) selectScreen;
  const AppDrawer({super.key, required this.selectScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.onPrimary,
              Theme.of(context).colorScheme.onPrimary.withOpacity(.8),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.fastfood,
                size: 58,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                "Cooking up!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () {
            selectScreen('meals');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.filter_alt,
            size: 26,
          ),
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () {
            selectScreen('filter');
          },
        )
      ]),
    );
  }
}
