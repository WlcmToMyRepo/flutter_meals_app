import 'package:flutter/material.dart';
import 'package:meals/models/categories.dart';

class GridViewItem extends StatelessWidget {
  final Category data;
  const GridViewItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                data.color.withOpacity(.55),
                data.color.withOpacity(.99)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Text(
          data.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
