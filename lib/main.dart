import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:meals/experiment/stack_widget.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/data/dummy_data.dart';
// import 'package:meals/screens/meals.dart';

final themeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.latoTextTheme());

void main() => runApp(
      MaterialApp(
        theme: themeData,
        home: CategoriesScreen(categories: data),
      ),
    );
