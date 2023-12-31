import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepOrange,
  Colors.orange,
  Colors.pink,
  Colors.indigo,
  Colors.amber,
  Colors.redAccent,
  Colors.lime,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0,
    this.isDarkMode = false
  })
      : assert(
            selectedColor >= 0, 'Selected color must greater or equals than 0'),
        assert(selectedColor <= colorList.length,
            'Selected color must less or equals than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true),
      );

  AppTheme copyWith({
    int? selectedColor, 
    bool? isDarkMode
    }) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
}
