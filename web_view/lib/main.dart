import 'package:flutter/material.dart';
import 'package:web_view/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(child: HomeScreen())
    )
  );
}