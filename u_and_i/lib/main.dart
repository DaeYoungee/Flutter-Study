import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 80.0,
            fontFamily: 'parisienne',
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 50.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        )
      ),
      home: HomeScreen(),
    )
  );
}