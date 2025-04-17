import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.red,
            child: Column(
              children: [
                Container(width: 50.0, height: 50.0, color: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
