import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text("U&I"),
                    Text("우리 처음 만날 날"),
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite, color: Colors.red,)),
                    Text("D+1"),
                  ],
                ),
              ),
              Expanded(
                child: Image.asset("asset/img/middle_image.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
