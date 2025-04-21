import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: Colors.white
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF2A3A7C), Color(0xFF000118)])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/image/logo.png'),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('VIDEO', style: style,),
                Text('PLAYER', style: style.copyWith(fontWeight: FontWeight.w700))
              ],
            )
          ],
        ),
      ),
    );
  }
}
