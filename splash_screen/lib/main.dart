import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFF6390ff),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('asset/img/logo.png')
              ],
            )
        ),
      )
  );
}
