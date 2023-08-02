import 'package:flutter/material.dart';

const _colorList = <Color> [
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
];



class AppTheme {

final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    }): assert(selectedColor >= 0, 'Selected color must greater or equals than 0'),
        assert(selectedColor <= _colorList.length, 'Selected color must less or equals than ${_colorList.length - 1}');
  
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: _colorList[selectedColor],
    appBarTheme: AppBarTheme(
      centerTitle: true
    ),
  );

}