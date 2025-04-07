import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen()
    ),
  );
}

// stless 단축키 활용
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6390ff),
      // option + enter 단축키 사용
      // wrap this widget, remove this widget 사용해보기
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
    );
  }
}

