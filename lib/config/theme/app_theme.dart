import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.teal,
  Colors.blue,
  Colors.yellow,
  Colors.green,
  Colors.red,
  Colors.pink,
  Colors.indigo
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }) : assert (selectedColor >= 0, 'Selected color must be greater than 0'),
       assert (selectedColor < colors.length, 'Selected color must be less or equal than ${colors.length}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colors[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

}