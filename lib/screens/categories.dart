import 'package:flutter/material.dart';
import 'package:meals/models/categories.dart';
import 'package:meals/widgets/gridview_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;
  const CategoriesScreen({super.key, required this.categories});

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
        itemBuilder: (context, index) => GridViewItem(data: categories[index]),
      ),
    );
  }
}
