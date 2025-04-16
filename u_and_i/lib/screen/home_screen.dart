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
                    Text(
                      "U&I",
                      style: TextStyle(
                        fontSize: 80.0,
                        fontFamily: "parisienne",
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "우리 처음 만날 날",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: "sunflower",
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: Colors.red),
                    ),
                    Text(
                      "D+1",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontFamily: "sunflower",
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "2023-11-23",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "sunflower",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Image.asset("asset/img/middle_image.png")),
            ],
          ),
        ),
      ),
    );
  }
}
