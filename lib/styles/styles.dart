import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color(0xFFFFEBEE),
  100: Color(0xFFFFCDD2),
  200: Color(0xFFEF9A9A),
  300: Color(0xFFE57373),
  400: Color(0xFFEF5350),
  500: Color(0xFFEF5350),
  600: Color(0xFFE53935),
  700: Color(0xFFD32F2F),
  800: Color(0xFFC62828),
  900: Color(0xFFB71C1C),
};

MaterialColor myColor = MaterialColor(0xFFE57373, color);

ThemeData stylesHome(BuildContext context) {
  return ThemeData(
    primarySwatch: myColor,
    fontFamily: 'Raleway',
    backgroundColor: Colors.pink,
    accentColor: Colors.deepPurple,
    accentColorBrightness: Brightness.dark,
    buttonTheme: ButtonTheme.of(context).copyWith(
      buttonColor: Colors.pink,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
