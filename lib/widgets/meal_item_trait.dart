import 'package:flutter/material.dart';

class MealMeta extends StatelessWidget {
  final String label;
  final IconData icon;
  const MealMeta({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        size: 17,
      ),
      Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      )
    ]);
  }
}
