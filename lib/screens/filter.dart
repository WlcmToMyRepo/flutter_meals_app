import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactosFreeFilterSet = false;
  bool _vegFilterSet = false;
  bool _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilter = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
    _lactosFreeFilterSet = activeFilter[Filter.lactosFree]!;
    _vegFilterSet = activeFilter[Filter.vegetarian]!;
    _veganFreeFilterSet = activeFilter[Filter.vegan]!;
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
          ref.read(filtersProvider.notifier).setFiltersFromMap({
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
