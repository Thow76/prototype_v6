import 'package:flutter/material.dart';

class AppTheme {
  TextTheme lightTextTheme = const TextTheme(
    headline1: TextStyle(
        fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: TextStyle(
        fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline3: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodyText1: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodyText2: TextStyle(fontSize: 16.0, color: Colors.white),
    caption: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  TextTheme darkTextTheme = const TextTheme(
    headline1: TextStyle(
        fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),
    headline2: TextStyle(
        fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),
    headline3: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),
    bodyText1: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),
    bodyText2: TextStyle(fontSize: 14.0, color: Colors.blueGrey),
    caption: TextStyle(
      fontSize: 18.0,
      color: Color.fromARGB(255, 57, 50, 91),
      fontWeight: FontWeight.bold,
    ),
  );

  ThemeData light() {
    return ThemeData(
      fontFamily: 'Arial',
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: Colors.white),
      canvasColor: const Color.fromARGB(255, 57, 50, 91),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.amber;
        }),
      ),
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 57, 50, 91),
          titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          fixedSize: const Size(300, 50),
          textStyle: const TextStyle(fontFamily: 'Arial', fontSize: 18),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 50),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 80, 100, 170),
              textStyle:
                  const TextStyle(fontFamily: 'ComicSans', fontSize: 20))),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 80, 100, 170)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color.fromARGB(255, 80, 100, 170),
      ),
      textTheme: lightTextTheme,
    );
  }

  ThemeData dark() {
    return ThemeData(
      fontFamily: 'ComicSans',
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(
        color: Colors.blueGrey,
      ),
      canvasColor: const Color.fromARGB(255, 29, 26, 45),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.blueGrey,
        backgroundColor: Color.fromARGB(255, 29, 26, 45),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blueGrey,
          fixedSize: const Size(300, 50),
          textStyle: const TextStyle(
            fontFamily: 'ComicSans',
            fontSize: 20,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 50),
              foregroundColor: Colors.blueGrey,
              backgroundColor: const Color.fromARGB(255, 50, 59, 95),
              textStyle: const TextStyle(
                fontFamily: 'ComicSans',
                fontSize: 20,
              ))),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.amber,
          backgroundColor: Color.fromARGB(255, 50, 59, 95)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color.fromARGB(255, 29, 26, 45),
      ),
      textTheme: darkTextTheme,
    );
  }
}
