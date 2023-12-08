import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final Map<Filter, bool> filter;
  const FilterScreen({super.key, required this.filter});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

enum Filter {
  glutenFree,
  lactosFree,
  vegetarian,
  vegan,
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactosFreeFilterSet = false;
  bool _vegFilterSet = false;
  bool _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.filter[Filter.glutenFree]!;
    _lactosFreeFilterSet = widget.filter[Filter.lactosFree]!;
    _vegFilterSet = widget.filter[Filter.vegetarian]!;
    _veganFreeFilterSet = widget.filter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: AppDrawer(selectScreen: (route) {
      //   if (route == 'meals') {
      //     Navigator.pop(context);
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //   } else {
      //     Navigator.pop(context);
      //   }
      // }),

      //Navigator.pushReplacement(context, newRoute) this will replace the previous screen with new one
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactosFree: _lactosFreeFilterSet,
            Filter.vegetarian: _vegFilterSet,
            Filter.vegan: _veganFreeFilterSet,
          });
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (value) {
                setState(() {
                  _glutenFreeFilterSet = value;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 24),
            ),
            SwitchListTile(
              value: _lactosFreeFilterSet,
              onChanged: (value) {
                setState(() {
                  _lactosFreeFilterSet = value;
                });
              },
              title: Text(
                'Lactos-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes lactos-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 24),
            ),
            SwitchListTile(
              value: _vegFilterSet,
              onChanged: (value) {
                setState(() {
                  _vegFilterSet = value;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 24),
            ),
            SwitchListTile(
              value: _veganFreeFilterSet,
              onChanged: (value) {
                setState(() {
                  _veganFreeFilterSet = value;
                });
              },
              title: Text(
                'Non - Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes non - vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 24),
            ),
          ],
        ),
      ),
    );
  }
}
