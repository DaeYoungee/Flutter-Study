import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF6390ff),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('asset/img/logo.png'),
              SizedBox(height: 20.0),
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    ),
  );
}
