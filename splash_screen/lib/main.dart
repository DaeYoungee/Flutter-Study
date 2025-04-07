import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFF6390ff),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/img/logo.png'),
                  CircularProgressIndicator(
                    color: Colors.white,
                  )
                ],
              ),
            )
        ),
      )
  );
}
